# frozen_string_literal: true

module Mutations
  module Recipe
    class CreateFavoriteMutation  < Mutations::BaseMutation
      description 'User creates an account'
      argument :user_id, ID, required: true
      argument :recipe_id, ID, required: true

      field :recipe, Types::RecipeType, null: true

      def resolve(input)
        user = User.find(input[:user_id])
        recipe = user.create_favorite_for(input[:recipe_id])

        # TODO: Refactor
        if recipe
          {
            recipe: recipe,
            success: true,
            errors: []
          }
        else
          {
            recipe: nil,
            success: false,
            errors: [{
              message: recipe.errors
            }]
          }
        end
      end
    end 
  end 
end 
