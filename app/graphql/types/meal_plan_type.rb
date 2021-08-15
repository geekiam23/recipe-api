module Types
  class MealPlanType < Types::BaseObject
    field :id, ID, null: false
    field :meal_day_id, Integer, null: true
    field :meal_type_id, Integer, null: true
    field :recipe_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :recipes, [RecipeType], null: true
  end
end
