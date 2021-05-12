module Types
  class RandomRecipeType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :servings, Integer, null: true
    field :summary, String, null: true
    field :image, String, null: true
    field :servings, String, null: true
    field :readyInMinutes, String, null: true
    field :aggregateLikes, String, null: true
    # field :instructions, String, null: true
    field :diets, [String], null: true
    field :occasions, [String], null: true
    field :dishTypes, [String], null: true
    field :cuisines, [String], null: true
  end
end
