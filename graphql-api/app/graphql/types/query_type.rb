Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :allProducts, !types[Types::ProductType] do
    argument :in_stock, types.Boolean
    resolve -> (obj, args, ctx) { 
      if args[:in_stock].present?
	if args[:in_stock]
      	  Product.where("inventory_count > 0")
        end
      else
      	Product.all
      end
    }
  end

  field :product, Types::ProductType do
    argument :product_id, types.Int
    argument :in_stock, types.Boolean
    
    resolve -> (obj, args, ctx) {
      if !args[:product_id].present?
        return
      end
      
      # I recognize I should probably do some validation on the product_id to prevent injection attacks
      if args[:in_stock].present?
        Product.where("inventory_count > 0 AND id = ?", args[:product_id]).first
      else
        Product.where("id = ?", args[:product_id]).first
      end 
    }
  end

  field :allCarts, !types[Types::CartType] do
    resolve -> (obj, args, ctx) { Cart.all }
  end

  field :cart, Types::CartType do
    argument :cart_id, types.Int
    
    resolve -> (obj, args, ctx) {
      if !args[:cart_id].present?
        return
      end

      Cart.where("id = ?", args[:cart_id]).first
    }
  end

  field :allCartProducts, !types[Types::CartProductType] do
    resolve -> (obj, args, ctx) { CartProduct.all }
  end  

  field :cartProduct, Types::CartProductType do
    argument :cart_product_id, types.Int

   resolve -> (obj, args, ctx) {
     if !args[:cart_product_id].present?
       return
     end

     CartProduct.where("id = ?", args[:cart_product_id]).first
   }
  end
end

