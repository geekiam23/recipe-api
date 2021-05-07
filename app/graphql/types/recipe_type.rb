module Types
  class RecipeType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :servings, Integer, null: true
    field :summary, String, null: true
    field :instructions, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: true
    field :diets, [DietType], null: true
    field :occasions, [OccasionType], null: true
    field :dish_types, [DishType], null: true
    field :cuisines, [CuisineType], null: true
  end
end
