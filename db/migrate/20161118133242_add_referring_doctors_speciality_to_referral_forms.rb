class AddReferringDoctorsSpecialityToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :referring_doctors_speciality, :string
  end
end
