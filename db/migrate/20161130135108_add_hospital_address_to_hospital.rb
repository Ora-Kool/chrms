class AddHospitalAddressToHospital < ActiveRecord::Migration[5.0]
  def change
    add_column :hospitals, :hospital_address, :string
  end
end
