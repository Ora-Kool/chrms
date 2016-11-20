class AddPleaseContinueWithToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :please_continue_with, :string
  end
end
