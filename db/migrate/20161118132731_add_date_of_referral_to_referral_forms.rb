class AddDateOfReferralToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :date_of_referral, :string
  end
end
