class AddPatientGenderToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :patient_gender, :string
  end
end
