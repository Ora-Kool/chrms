class AddPatientFullNamesToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :patient_full_names, :string
  end
end
