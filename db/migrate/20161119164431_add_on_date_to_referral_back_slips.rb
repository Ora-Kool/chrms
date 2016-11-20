class AddOnDateToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :on_date, :string
  end
end
