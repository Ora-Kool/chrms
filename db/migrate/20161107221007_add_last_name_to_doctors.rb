class AddLastNameToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :last_name, :string
  end
end
