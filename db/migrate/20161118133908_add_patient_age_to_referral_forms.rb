class AddPatientAgeToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :patient_age, :integer
  end
end
