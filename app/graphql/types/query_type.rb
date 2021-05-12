module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :recipes, [RecipeType], null: true do
      description "Get all recipes"
    end
  
    def recipes
      Recipe.includes(:cuisines, :diets, :dish_types, :occasions)
    end

    field :randomRecipes, [RandomRecipeType], null: true do
      description "Get random recipes"
      argument :number, String, required: false
      argument :tags, [String], required: false
    end
  
    def randomRecipes(number: nil, tags: nil)
      params = { number: number, tags: tags}
      Spoonacular::Recipe.new.random(params)
      # byebug
    end

    # field :currentUserFavRecipes, [RecipeType], null: true do
    #   description "Get current user favorite recipes"
    # end
  
    # def currentUserFavRecipes
    #   current_user.favorites
    # end

  end
end
