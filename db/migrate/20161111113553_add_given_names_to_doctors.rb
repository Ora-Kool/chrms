class AddGivenNamesToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :given_names, :string
  end
end
