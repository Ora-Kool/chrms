class AddDoctorIdToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :doctor_id, :integer
  end
end
