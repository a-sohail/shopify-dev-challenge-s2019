class AddCartToCartProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_products, :cart, foreign_key: true
  end
end
