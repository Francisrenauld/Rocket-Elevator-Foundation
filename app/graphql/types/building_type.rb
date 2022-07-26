module Types
  class BuildingType < Types::BaseObject
    field :id, ID, null: true
    field :Full_Name_Of_The_Building_Administrator, String, null: true
    field :Email_Of_The_Administrator_Of_The_Building, String, null: true
    field :Phone_Number_Of_The_Building_Administrator, String, null: true
    field :Full_Name_Of_The_Technical_Contact_For_The_Building, String, null: true
    field :Technical_Contact_Email_For_The_Building, String, null: true
    field :Technical_Contact_Phone_For_The_Building, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
    field :customer_id, ID, null: true
    field :address_id, ID, null: true
    field :address, Types::AddressType, null: true
    field :batteries, [Types::BatteryType], null: true
    field :building_details, [Types::BuildingDetailType], null: true
    field :customer, [Types::CustomerType], null: true
    field :interventions, [Types::FactInterventionType], null: true
    field :address_info, String, null: true

    def interventions
      FactIntervention.where(buildingid: object.id)
    end

    def customer
      Customer.where(id: object.customer_id)
    end
  end
end