module Types
  class IngredientType < Types::BaseObject
    field :id, ID, null: false
    field :aisle, String, null: true
    field :consistency, String, null: true
    field :name, String, null: true
    field :nameClean, String, null: true
    field :original, String, null: true
    field :originalString, String, null: true
    field :originalClean, String, null: true
    field :amount, Integer, null: true
    field :unit, String, null: true
    field :meta, String, null: true
    field :metaInformation, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
