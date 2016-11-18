class AddTreatmentsGivenToReferralForms < ActiveRecord::Migration[5.0]
  def change
    add_column :referral_forms, :treatment_given, :text
  end
end
