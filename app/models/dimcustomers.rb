class DimCustomers < ActiveRecord::Base
    self.abstract_class = true
    establish_connection :"psql"
end
