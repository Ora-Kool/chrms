class AddHospitalCityToHospitals < ActiveRecord::Migration[5.0]
  def change
    add_column :hospitals, :hospital_city, :string
  end
end
