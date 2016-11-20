class AddWhenPatientWasSeenToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :when_patient_was_seen, :string
  end
end
