class AddReferredFacilityDoctorsNameToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :referred_facility_doctors_name, :string
  end
end
