class AddReferralStatusToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :referral_status, :string
  end
end
