class AddBackSlipTokenToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :back_slip_token, :string
  end
end
