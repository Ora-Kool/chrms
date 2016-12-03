class AddPatientIdentityNumberToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :patient_identity_number, :string
  end
end
