class AddPatientIdentityNumberToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :patient_identity_number, :string
  end
end
