class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :Type
      t.integer :Number_Of_Floors_Served
      t.string :Status
      t.string :Information
      t.string :Notes

      t.timestamps
    end
    add_reference :columns, :battery, foreign_key: true
  end
end
