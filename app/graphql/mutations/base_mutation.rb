module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    field :success, Boolean, null: false
    field :errors, [Types::ErrorType], null: true

    protected

    def authorize_user
      if context[:current_user].present?
        return true
      else
        raise GraphQL::ExecutionError, "User not signed in"
      end
    end

    def current_user
      context[:current_user]
    end
  end
end
