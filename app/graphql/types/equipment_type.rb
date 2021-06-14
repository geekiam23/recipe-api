module Types
  class EquipmentType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :image, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
