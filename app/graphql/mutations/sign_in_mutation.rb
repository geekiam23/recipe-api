# frozen_string_literal: true

module Mutations
  class SignInMutation  < Mutations::BaseMutation
    description 'User signs into account'
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(input)
      user = User.find_for_database_authentication(email: input[:email])

      if user && user.valid_password?(input[:password])
        context[:current_user] = user

        {
          user: user,
          token: user.generate_jwt,
          success: true,
          errors: []
        }
      else
        {
          user: nil,
          success: false,
          errors: [{
            path: nil,
            message: 'Incorrect email or password'
          }]
        }
      end
    end
  end 
end 
