class AddElevatorTotalPriceToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Elevator_Total_Price, :text
  end
end
