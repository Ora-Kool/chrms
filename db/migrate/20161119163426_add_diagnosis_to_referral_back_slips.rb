class AddDiagnosisToReferralBackSlips < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_back_slips, :diagnosis, :text
  end
end
