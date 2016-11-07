class AddHospitalRefToStaffs < ActiveRecord::Migration[5.0]
  def change
    add_reference :staffs, :hospital, foreign_key: true
  end
end
