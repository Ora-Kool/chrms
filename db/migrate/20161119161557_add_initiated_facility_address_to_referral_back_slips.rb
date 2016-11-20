class AddInitiatedFacilityAddressToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :initiated_facility_address, :string
  end
end
