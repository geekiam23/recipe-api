# frozen_string_literal: true

module Mutations
  module Recipe
    class DeleteFavoriteMutation  < Mutations::BaseMutation
      description 'User creates an account'
      argument :user_id, ID, required: true
      argument :recipe_id, ID, required: true

      def resolve(input)
        user = User.find(input[:user_id])
        favorite = user.favorites.find_by(favoritable_id: input[:recipe_id])

        if favorite.destroy
          {
            success: true,
            errors: []
          }
        else
          {
            success: false,
            errors: [{
              message: favorite.errors
            }]
          }
        end
      end
    end 
  end 
end 
