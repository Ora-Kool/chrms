class AddDoctorsNameToReferrals < ActiveRecord::Migration[5.0]
  def change
    add_column :referrals, :doctors_name, :string
  end
end
