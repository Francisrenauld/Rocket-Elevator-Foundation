class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :Type_Of_Address
      t.string :Status
      t.string :Entity
      t.string :Number_And_Street
      t.string :Suite_Or_Apartment
      t.string :City
      t.string :Postal_Code
      t.string :Country
      t.string :Notes
      t.float :Lat
      t.float :Lng

      t.timestamps
    end
  end
end
