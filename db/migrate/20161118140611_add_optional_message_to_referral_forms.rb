class AddOptionalMessageToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :optional_message, :text
  end
end
