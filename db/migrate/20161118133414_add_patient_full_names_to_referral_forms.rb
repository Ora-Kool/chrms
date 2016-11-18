class AddPatientFullNamesToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :patient_full_names, :string
  end
end
