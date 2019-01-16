class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :quantity
      t.float :total_cost

      t.timestamps
    end
  end
end
