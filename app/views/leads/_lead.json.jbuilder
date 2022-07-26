json.extract! lead, :id, :Full_Name_Of_The_Contact, :Company_Name, :Email, :Phone, :Project_Name, :Project_Description, :Departement_In_Charge_Of_The_Elevators, :Message, :Attached_File_Stored_As_A_Binary_File, :created_at, :updated_at
json.url lead_url(lead, format: :json)
