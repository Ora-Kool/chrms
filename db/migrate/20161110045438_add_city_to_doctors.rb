class AddCityToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :city, :string
  end
end
