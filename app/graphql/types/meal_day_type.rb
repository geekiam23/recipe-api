module Types
  class MealDayType < Types::BaseObject
    field :id, ID, null: false
    field :day, GraphQL::Types::ISO8601Date, null: true
    field :user_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :meal_plans, [MealPlanType], null: true
    field :meal_types, [MealType], null: true
  end
end
