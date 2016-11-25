class AddResetToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :reset_digest, :string
    add_column :doctors, :reset_sent_at, :datetime
  end
end
