# frozen_string_literal: true
module Mutations
  class SignOutMutation < Mutations::BaseMutation
    field :user, Types::UserType, null: false

    def resolve
      authorize_user

      if current_user.present?
        success = current_user.reset_authentication_token!

        Mutations::MutationResult.call(
          obj: { user: current_user },
          success: success,
          errors: current_user.errors
        )
      else
        GraphQL::ExecutionError.new("User not signed in")
      end
    end
  end
end
