class AddReceivedDoctorsNumberToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :received_doctors_number, :string
  end
end
