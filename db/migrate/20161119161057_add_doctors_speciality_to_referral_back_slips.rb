class AddDoctorsSpecialityToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :doctors_speciality, :string
  end
end
