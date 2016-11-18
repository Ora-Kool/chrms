class AddPatientAddressToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :patient_address, :string
  end
end
