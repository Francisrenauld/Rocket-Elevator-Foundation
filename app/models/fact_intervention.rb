class FactIntervention < ActiveRecord::Base
    self.table_name = 'factintervention'
    establish_connection :"psql"
end
