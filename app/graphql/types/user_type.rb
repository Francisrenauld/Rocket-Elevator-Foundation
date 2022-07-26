module Types
  class UserType < Types::BaseObject
field :id, ID, null: true
    field :admin, String, null: true
    field :email, String, null: true
    field :encrypted_password, String, null: true
    field :reset_password_token, String, null: true
    field :reset_password_sent_at, String, null: true
    field :remember_created_at, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
    field :customer, Types::CustomerType, null: true
    field :employee, Types::EmployeeType, null: true   
   end
end
