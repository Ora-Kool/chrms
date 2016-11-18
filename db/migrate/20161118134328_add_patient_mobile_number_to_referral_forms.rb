class AddPatientMobileNumberToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :patient_mobile_number, :string
  end
end
