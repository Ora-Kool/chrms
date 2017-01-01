class AddBloodGroupToReferralForm < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :blood_group, :string
  end
end
