module Types
  class ElevatorType < Types::BaseObject
    field :id, ID, null: true
    field :Serial_Number, String, null: true
    field :Model, String, null: true
    field :Type, String, null: true
    field :Status, String, null: true
    field :Date_Of_Commissioning, String, null: true
    field :Date_Of_Last_Inspection, String, null: true
    field :Certificate_Of_Inspection, String, null: true
    field :Information, String, null: true
    field :Notes, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
    field :column_id, ID, null: true  
    field :column, Types::ColumnType, null: true  
  end
end
