module Types
  class StepType < Types::BaseObject
    field :id, ID, null: false
    field :description, String, null: true
    field :number, Integer, null: true
    field :ingredient_id, Integer, null: false
    field :equipment_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
