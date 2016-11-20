class CreateReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    create_table :referral_back_slips do |t|

      t.timestamps
    end
  end
end
