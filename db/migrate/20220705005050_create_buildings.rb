class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :Full_Name_Of_The_Building_Administrator
      t.string :Email_Of_The_Administrator_Of_The_Building
      t.string :Phone_Number_Of_The_Building_Administrator
      t.string :Full_Name_Of_The_Technical_Contact_For_The_Building
      t.string :Technical_Contact_Email_For_The_Building
      t.string :Technical_Contact_Phone_For_The_Building

      t.timestamps
    end
    add_reference :buildings, :customer, foreign_key: true
    add_reference :buildings, :address, foreign_key: true
  end
end
