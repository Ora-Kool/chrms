class AddReferBackToToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :refer_back_to, :string
  end
end
