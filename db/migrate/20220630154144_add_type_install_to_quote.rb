class AddTypeInstallToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Type_Of_Installation, :string
  end
end
