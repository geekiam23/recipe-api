module Types
  class MutationType < Types::BaseObject
    field :sign_in_mutation, mutation: Mutations::SignInMutation
    field :sign_out_mutation, mutation: Mutations::SignOutMutation

  end
end
