class AddReplyingDateToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :replying_date, :string
  end
end
