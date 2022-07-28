module Types
  class EmployeeType < Types::BaseObject
    field :id, ID, null: true
    field :First_Name, String, null: true
    field :Last_Name, String, null: true
    field :Title_Or_Function, String, null: true
    field :Email, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
    field :user_id, String, null: true
    field :battery, Types::BatteryType, null: true  
    field :user, Types::UserType, null: true  
  end
end
