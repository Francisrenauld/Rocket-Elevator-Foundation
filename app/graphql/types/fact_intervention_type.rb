module Types
  class FactInterventionType < Types::BaseObject
    field :id, ID, null: true
    field :employeeid, ID, null: true
    field :buildingid, ID, null: true
    field :batteryid, ID, null: true
    field :columnid, ID, null: true
    field :elevatorid, ID, null: true
    field :start_date_and_time_of_the_intervention, String, null: true
    field :date_and_time_of_the_end_of_the_intervention, String, null: true
    field :result, String, null: true
    field :report, String, null: true
    field :status, String, null: true
    field :building, Types::BuildingType, null: true
    field :address, String, null: true
    field :customer, Types::CustomerType, null: true

    def building
      Building.find(object.buildingid)
    end

    def address
      building.address.Number_And_Street
    end
  end
end
