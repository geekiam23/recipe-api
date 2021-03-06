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
    end
    
    field :getRecipe, RecipeType, null: true do
      description "Get recipe info"
      argument :id, String, required: true
    end
  
    def getRecipe(input)
      Recipe.find(input[:id])
    end
    
    # TODO: Change to save recipe in db when looking up
    field :getRandomRecipe, RandomRecipeType, null: true do
      description "Get random recipe info"
      argument :id, String, required: true
    end
  
    def getRandomRecipe(input)
      Spoonacular::Recipe.new.info(input[:id])
    end
    
    field :getUser, UserType, null: true do
      description "Get current user info"
      argument :token, String, required: true
    end
  
    def getUser(input)
      User.find_by(token: input[:token])
    end
  end
end
