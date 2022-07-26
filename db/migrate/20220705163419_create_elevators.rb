class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.integer :Serial_Number
      t.string :Model
      t.string :Type
      t.string :Status
      t.date :Date_Of_Commissioning
      t.date :Date_Of_Last_Inspection
      t.string :Certificate_Of_Inspection
      t.string :Information
      t.string :Notes

      t.timestamps
    end
    add_reference :elevators, :column, foreign_key: true
  end
end
