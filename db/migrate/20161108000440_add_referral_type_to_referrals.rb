class AddReferralTypeToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :referral_type, :string
  end
end
