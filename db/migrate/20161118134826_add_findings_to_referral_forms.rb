class AddFindingsToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :findings, :text
  end
end
