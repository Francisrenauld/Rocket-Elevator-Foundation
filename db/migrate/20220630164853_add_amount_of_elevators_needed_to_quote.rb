class AddAmountOfElevatorsNeededToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Amount_Of_Elevators_Needed, :integer
  end
end
