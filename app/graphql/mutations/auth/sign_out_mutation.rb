# frozen_string_literal: true
module Mutations
  module Auth
    class SignOutMutation < Mutations::BaseMutation
      description 'User signs out of account'
      argument :token, String, required: true
      
      field :user, Types::UserType, null: false

      def resolve(input)
        @user = User.find_by(token: input[:token])
        
        if @user.present?
          @user.update_columns(token: nil)
          {
            success: true,
            errors: []
          }
        else
          {
            success: false,
            errors: [{
              message: 'User already signed out'
            }]
          }
        end
      end
    end
  end
end
