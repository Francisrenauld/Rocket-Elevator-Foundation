# class CreateBatteries < ActiveRecord::Migration[5.2]
#   def change
#     create_table :batteries do |t|
#       t.string :Type
#       t.string :Status
#       t.integer :EmployeeId
#       t.date :Date_Of_Commissioning
#       t.date :Date_Of_Last_Inspection
#       t.string :Certificate_Of_Operations
#       t.string :Information
#       t.string :Notes

#       t.timestamps
#     end
#     add_reference :batteries, :buildings, foreign_key: true
#   end
# end

class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :Type
      t.string :Status
      t.date :Date_Of_Commissioning
      t.date :Date_Of_Last_Inspection
      t.string :Certificate_Of_Operations
      t.string :Information
      t.string :Notes

      t.timestamps
    end
    add_reference :batteries, :building, foreign_key: true
  end
end

