class AddPatientFullNamesToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :patient_full_names, :string
  end
end
