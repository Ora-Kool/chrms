class AddReasonsForReferralToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :reasons_for_referral, :text
  end
end
