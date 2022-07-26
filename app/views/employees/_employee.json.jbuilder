json.extract! employee, :id, :First_Name, :Last_Name, :Title_Or_Function, :Email, :created_at, :updated_at
json.url employee_url(employee, format: :json)
