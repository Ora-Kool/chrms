class AddEthnicToReferralForm < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :ethnic, :string
  end
end
