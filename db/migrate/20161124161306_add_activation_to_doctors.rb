class AddActivationToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :activation_digest, :string
    add_column :doctors, :activated, :boolean, default: false
    add_column :doctors, :activated_at, :datetime
  end
end
