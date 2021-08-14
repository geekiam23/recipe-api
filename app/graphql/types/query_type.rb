module Types
  class QueryType < Types::BaseObject
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
    
    def randomRecipes(number: 10, tags: nil, user_id: 1)
      params = { number: number, tags: tags}
      spoon_recipes = Spoonacular::Recipe.new.random(params)
      spoon_recipes.map do |r|
        Recipe.get_recipe_by_spoonacular_id(user_id, r['id'])
      end
    end
    
    field :getRecipe, RecipeType, null: true do
      description "Get recipe info"
      argument :id, ID, required: true
    end
  
    def getRecipe(input)
      Recipe.find(input[:id])
    end
    
    field :getSpoonacularRecipe, RandomRecipeType, null: true do
      description "Get spoonacular recipe info"
      argument :spoonacular_id, ID, required: true
      argument :user_id, ID, required: true
    end
  
    def getSpoonacularRecipe(input)
      Recipe.get_recipe_by_spoonacular_id(input[:user_id], input[:spoonacular_id])
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
