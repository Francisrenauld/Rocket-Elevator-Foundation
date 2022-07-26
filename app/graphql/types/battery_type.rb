module Types
  class BatteryType < Types::BaseObject
    field :id, ID, null: true
    field :Type, String, null: true
    field :Status, String, null: true
    field :Date_Of_Commissioning, String, null: true
    field :Date_Of_Last_Inspection, String, null: true
    field :Certificate_Of_Operations, String, null: true
    field :Information, String, null: true
    field :Notes, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
    field :building_id, String, null: true
    field :employee_id, String, null: true
    field :employee, Types::EmployeeType, null: true
    field :building, Types::BuildingType, null: true
    field :column, Types::ColumnType, null: true
  end
end
