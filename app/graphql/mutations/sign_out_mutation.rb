# frozen_string_literal: true
module Mutations
  class SignOutMutation < Mutations::BaseMutation
    field :user, Types::UserType, null: false

    def resolve(input)
      @user = User.find_by(token: input[:token])
      @user.update_column(token: nil)

        Mutations::MutationResult.call(
          obj: { user: @user },
          success: success,
          errors: @user.errors
        )
    end
  end
end
