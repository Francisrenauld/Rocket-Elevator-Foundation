module Types
  class AddressType < Types::BaseObject
    field :id, ID, null: true
    field :Type_Of_Address, String, null: true
    field :Status, String, null: true
    field :Entity, String, null: true
    field :Number_And_Street, String, null: true
    field :Suite_Or_Apartment, String, null: true
    field :City, String, null: true
    field :Postal_Code, String, null: true
    field :Country, String, null: true
    field :Notes, String, null: true
    field :lat, String, null: true
    field :lng, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
    field :building, Types::BuildingType, null: true
    field :customer, Types::CustomerType, null: true
  end
end
