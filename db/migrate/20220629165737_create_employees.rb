class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :First_Name
      t.string :Last_Name
      t.string :Title_Or_Function
      t.string :Email

      t.timestamps
    end
  end
end
