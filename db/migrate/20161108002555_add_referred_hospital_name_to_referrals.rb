class AddReferredHospitalNameToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :referred_hospital_name, :string
  end
end
