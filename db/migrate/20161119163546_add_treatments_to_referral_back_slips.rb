class AddTreatmentsToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :treatments, :text
  end
end
