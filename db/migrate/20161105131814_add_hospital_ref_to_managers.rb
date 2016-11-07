class AddHospitalRefToManagers < ActiveRecord::Migration[5.0]
  def change
    add_reference :managers, :hospital, foreign_key: true
  end
end
