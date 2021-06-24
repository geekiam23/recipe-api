module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    field :success, Boolean, null: false
    field :errors, [Types::ErrorType], null: true
  end
end
