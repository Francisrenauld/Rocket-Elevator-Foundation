class AddElevatorUnitPriceToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Elevator_Unit_Price, :text
  end
end
