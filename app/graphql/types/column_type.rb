module Types
  class ColumnType < Types::BaseObject
    field :id, ID, null: true
    field :Type, String, null: true
    field :Number_Of_Floors_Served, String, null: true
    field :Status, String, null: true
    field :Information, String, null: true
    field :Notes, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
    field :battery_id, ID, null: true
    field :battery, Types::BatteryType, null: true
    field :elevator, Types::ElevatorType, null: true
  end
end
