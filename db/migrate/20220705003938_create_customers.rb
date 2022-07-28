class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :Company_Name
      t.string :Company_Headquarters_Adress
      t.string :Full_Name_Of_The_Company_Contact
      t.string :Company_Contact_Phone
      t.string :Email_Of_The_Company_Contact
      t.text :Company_Description
      t.string :Full_Name_Of_Service_Technical_Authority
      t.string :Technical_Authority_Phone_For_Service
      t.string :Technical_Manager_Email_For_Service

      t.timestamps

      
    end
    add_reference :customers, :user, foreign_key: true
  end
end
