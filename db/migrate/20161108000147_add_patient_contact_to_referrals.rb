class AddPatientContactToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :patient_contact, :string
  end
end
