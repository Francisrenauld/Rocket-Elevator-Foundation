module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: true
    field :Company_Name, String, null: true
    field :Company_Headquarters_Adress, String, null: true
    field :Full_Name_Of_The_Company_Contact, String, null: true
    field :Company_Contact_Phone, String, null: true
    field :Email_Of_The_Company_Contact, String, null: true
    field :Company_Description, String, null: true
    field :Full_Name_Of_Service_Technical_Authority, String, null: true
    field :Technical_Authority_Phone_For_Service, String, null: true
    field :Technical_Manager_Email_For_Service, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
    field :user_id, ID, null: true
    field :address_id, ID, null: true
    field :user, Types::UserType, null: true
    field :building, Types::BuildingType, null: true
    field :address, Types::AddressType, null: true
  end
end
