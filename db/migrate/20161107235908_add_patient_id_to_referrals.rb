class AddPatientIdToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :patientID, :string
  end
end
