class AddReferredFacilityNameToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :referred_facility_name, :string
  end
end
