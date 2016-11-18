class AddPatientClinicalHistoryToReferralForm < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :patient_clinical_history, :text
  end
end
