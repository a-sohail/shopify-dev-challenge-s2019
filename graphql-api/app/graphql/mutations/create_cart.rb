Mutations::CreateCart = GraphQL::Field.define do
  name 'CreateCart'
  type Types::CartType
  description 'Create a Cart to hold Products'

  resolve ->(_obj, args, _ctx) do
    Cart.create!(
      total_cost: 0
    )
  end
end
