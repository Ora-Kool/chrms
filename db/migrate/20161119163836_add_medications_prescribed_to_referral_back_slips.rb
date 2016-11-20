class AddMedicationsPrescribedToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :medications_prescribed, :text
  end
end
