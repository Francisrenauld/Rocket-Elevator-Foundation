class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.string :Information_Key
      t.string :Value

      t.timestamps
    end
    add_reference :building_details, :building, foreign_key: true
  end
end
