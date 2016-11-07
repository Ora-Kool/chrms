class AddHospitalRefToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_reference :doctors, :hospital, foreign_key: true
  end
end
