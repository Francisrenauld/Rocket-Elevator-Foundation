class AddFinalPriceToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Final_Price, :text
  end
end
