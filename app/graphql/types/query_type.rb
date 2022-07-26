module Types
  class QueryType < BaseObject
    # queries are just represented as fields
    # `building etc.` is automatically camelcased to `Building etc.`
    field :all_adresses, [AddressType], null: false
    field :all_batteries, [BatteryType], null: false
    field :all_building_details, [BuildingDetailType], null: false
    field :all_columns, [ColumnType], null: false
    field :all_customers, [CustomerType], null: false
    field :all_elevators, [ElevatorType], null: false
    field :all_employees, [EmployeeType], null: false
    field :all_users, [UserType], null: false

    field :building, [BuildingType], null: false do
        argument :id, ID, required: false 
    end

    field :fact_interventions, [FactInterventionType], null: false do
        argument :id, ID, required: false 
    end   
    
    field :fact_interventions_building, [FactInterventionType], null: false do
        argument :buildingid, ID, required: false 
    end

    field :fact_interventions_employee, [FactInterventionType], null: false do
        argument :employeeid, ID, required: false 
    end
    # this method is invoked, when `building etc.` fields is being resolved
    def building(id: nil)
      if id
        Building.where(id: id)
      else
        Building.all
      end
    end

    def all_adresses
      Address.all
    end

    def all_batteries
      Battery.all
    end

    def all_building_details
      BuildingDetail.all
    end

    def all_columns
      Column.all
    end

    def all_customers
      Customer.all
    end

    def all_elevators
      Elevator.all
    end

    def all_employees
      Employee.all
    end

    def all_users
      User.all
    end

    def all_dimcustomers
      DimCustomers.all
    end
    
    def fact_interventions(id: nil)
      if id
        FactIntervention.where(id: id)
      else
        FactIntervention.all
      end
    end
    
    def fact_interventions_building(buildingid: nil)
      if buildingid
        FactIntervention.where(buildingid: buildingid)
      else
        FactIntervention.all
      end
    end

    def fact_interventions_employee(employeeid: nil)
      if employeeid
        FactIntervention.where(employeeid: employeeid)
      else
        FactIntervention.all
      end
    end
  end
end