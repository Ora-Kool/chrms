class AddTypeOfReferralToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :type_of_referral, :string
  end
end
