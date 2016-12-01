class AddPatientTokenToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :patient_token, :string
  end
end
