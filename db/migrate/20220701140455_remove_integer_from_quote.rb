class RemoveIntegerFromQuote < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :integer, :string
  end
end
