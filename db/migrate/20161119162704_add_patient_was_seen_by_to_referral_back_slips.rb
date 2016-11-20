class AddPatientWasSeenByToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :patient_was_seen_by, :string
  end
end
