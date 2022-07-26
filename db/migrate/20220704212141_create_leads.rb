class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :Full_Name_Of_The_Contact
      t.string :Company_Name
      t.string :Email
      t.string :Phone
      t.string :Project_Name
      t.string :Project_Description
      t.string :Departement_In_Charge_Of_The_Elevators
      t.text :Message
      

      t.timestamps
    end
  end
end
