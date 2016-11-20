class AddReferralBackSlipMessageToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :referral_back_slip_message, :text
  end
end
