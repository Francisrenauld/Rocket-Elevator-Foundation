class AddInstallationFeesToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Installation_Fees, :text
  end
end
