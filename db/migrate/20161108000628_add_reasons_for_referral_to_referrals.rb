class AddReasonsForReferralToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :reasons_for_referrals, :text
  end
end
