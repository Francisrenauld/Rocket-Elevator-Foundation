class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :Building_Type
      t.integer :Number_of_apartments
      t.integer :Number_of_floors
      t.integer :Number_of_basements
      t.string :Number_of_separate_companies
      t.string :integer
      t.integer :Number_of_parking_spaces
      t.integer :Maximum_Number_Of_Occupants_Per_Floor
      t.integer :Number_Of_Dstinct_Businesses
      t.integer :Number_Of_Elevators_Needed
      t.integer :Number_Of_Hours_Of_Activity_Of_The_Building
 
      t.timestamps
    end
  end
end
