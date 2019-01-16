Mutations::CompleteCart = GraphQL::Field.define do
  name 'CompleteCart'
  type Types::CartType
  description 'Complete a Cart'

  argument :cart_id, !types.Int

  resolve ->(_obj, args, _ctx) do
    cart = Cart.find_by(id: args[:cart_id])
    cart_products = cart.cart_products
    
    # Make sure inventory is available for each and every product in cart
    cart_products.each do |cart_product|
      if cart_product.quantity > cart_product.product.inventory_count
        return cart
      end
    end
    
    cart_products.each do |cart_product|
      cart_product.product.update_attribute(:inventory_count, cart_product.product.inventory_count - cart_product.quantity)
    end

    cart.update_attribute(:cart_products, [])
    cart.update_attribute(:total_cost, 0.00)
    cart_products.destroy_all
    return cart
  end
end
