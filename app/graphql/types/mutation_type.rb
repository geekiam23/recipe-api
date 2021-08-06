module Types
  class MutationType < Types::BaseObject
    field :create_account_mutation, mutation: Mutations::Auth::CreateAccountMutation
    field :sign_in_mutation, mutation: Mutations::Auth::SignInMutation
    field :sign_out_mutation, mutation: Mutations::Auth::SignOutMutation
  end
end
