class AddSignatureToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :signature, :string
  end
end
