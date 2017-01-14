class AddDiagnosisToReferralForm < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :diagnosis, :string
  end
end
