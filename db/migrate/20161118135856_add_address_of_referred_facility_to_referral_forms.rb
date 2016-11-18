class AddAddressOfReferredFacilityToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :address_of_referred_facility, :string
  end
end
