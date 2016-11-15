class AddCountryToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :country, :string
  end
end
