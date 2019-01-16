Mutations::CreateCartProduct = GraphQL::Field.define do
  name 'CreateCartProduct'
  type Types::CartProductType
  description 'Create a Cart Product'

  argument :cart_id, !types.Int
  argument :product_id, !types.Int
  argument :quantity, !types.Int

  resolve ->(_obj, args, _ctx) do
    total_product_cost = Product.where("id = ?", args[:product_id]).first.price * args[:quantity]
    cart = Cart.where("id = ?", args[:cart_id]).first
    cart.update_attribute(:total_cost, cart.total_cost + total_product_cost)
    CartProduct.create!(
      cart: cart,
      product: Product.find_by(id: args[:product_id]),
      quantity: args[:quantity],
      total_cost: total_product_cost
    )
  end
end
