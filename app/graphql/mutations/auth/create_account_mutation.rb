# frozen_string_literal: true

module Mutations
  module Auth
    class CreateAccountMutation  < Mutations::BaseMutation
      description 'User creates an account'
      argument :email, String, required: true
      argument :password, String, required: true
      argument :passwordConfirmation, String, required: true

      field :token, String, null: true
      field :user, Types::UserType, null: true

      def resolve(input)
        user = User.new({:email => input[:email],
                            :password => input[:password],
                            :password_confirmation => input[:passwordConfirmation]
                            })

        if user.save
          {
            user: user,
            token: user.token,
            success: true,
            errors: []
          }
        elsif user.errors.messages[:email]
          {
            user: nil,
            success: false,
            errors: [{
              message: 'Email format is invalid'
            }]
          }
        elsif user.errors.messages[:password]
          {
            user: nil,
            success: false,
            errors: [{
              message: 'Password is too short (minimum is 6 characters)'
            }]
          }
        elsif user.errors.messages[:password_confirmation]
          {
            user: nil,
            success: false,
            errors: [{
              message: 'Passwords do not match'
            }]
          }
        else
          {
            user: nil,
            success: false,
            errors: [{
              message: user.errors
            }]
          }
        end
      end
    end 
  end 
end 
