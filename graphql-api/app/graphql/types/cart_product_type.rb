Types::CartProductType = GraphQL::ObjectType.define do
  name 'CartProduct'

  field :id, !types.ID
  field :cart, -> { Types::CartType }
  field :product, -> { Types::ProductType }
  field :quantity, !types.Int
  field :total_cost, !types.Float
end
