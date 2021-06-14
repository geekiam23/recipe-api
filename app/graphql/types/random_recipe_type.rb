module Types
  class RandomRecipeType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :servings, Integer, null: true
    field :summary, String, null: true
    field :image, String, null: true
    field :servings, String, null: true
    field :ready_in_minutes, String, null: true
    field :aggregate_likes, String, null: true
    # field :instructions, String, null: true
    field :diets, [String], null: true
    field :occasions, [String], null: true
    field :dish_types, [String], null: true
    field :cuisines, [String], null: true
  end
end
