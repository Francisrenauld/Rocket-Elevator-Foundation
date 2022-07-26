class AddCompanyNameToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Company_Name, :string
  end
end
