class AddPatientAgeToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :patient_age, :integer
  end
end
