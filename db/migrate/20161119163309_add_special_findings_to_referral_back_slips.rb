class AddSpecialFindingsToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :special_findings, :text
  end
end
