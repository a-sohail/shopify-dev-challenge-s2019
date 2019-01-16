Mutations::CreateProduct = GraphQL::Field.define do
  name 'CreateProduct'
  type Types::ProductType
  description 'Create a Product'

  argument :title, !types.String
  argument :price, !types.Float
  argument :inventory_count, !types.Int

  resolve ->(_obj, args, _ctx) do
    Product.create!(
      title: args[:title],
      price: args[:price],
      inventory_count: args[:inventory_count]
    )
  end
end
