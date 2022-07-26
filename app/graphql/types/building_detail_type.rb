module Types
  class BuildingDetailType < Types::BaseObject
    field :id, ID, null: true
    field :Information_Key, String, null: true
    field :Value, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
    field :building_id, ID, null: true
    field :building, Types::BuildingType, null: true
  end
end
