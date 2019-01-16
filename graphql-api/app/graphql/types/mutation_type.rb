Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createProduct, Mutations::CreateProduct

  field :createCart, Mutations::CreateCart

  field :createCartProduct, Mutations::CreateCartProduct

  field :completeCart, Mutations::CompleteCart
end
