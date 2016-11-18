class CreateReferralForms < ActiveRecord::Migration[5.0]
  def change
    create_table :referral_forms do |t|

      t.timestamps
    end
  end
end
