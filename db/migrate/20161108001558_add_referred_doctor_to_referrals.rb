class AddReferredDoctorToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :referred_doctor, :string
  end
end
