class AddRememberDigestToManagers < ActiveRecord::Migration[5.0]
  def change
    add_column :managers, :remember_digest, :string
  end
end
