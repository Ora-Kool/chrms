class AddFirstNameToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :first_name, :string
  end
end
