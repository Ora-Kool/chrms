class AddInitiatingFacilityNameToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :initiating_facility_name, :string
  end
end
