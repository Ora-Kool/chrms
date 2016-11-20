class AddDoctorReplyingNamesToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :doctor_replying_names, :string
  end
end
