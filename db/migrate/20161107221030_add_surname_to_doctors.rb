class AddSurnameToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :surname, :string
  end
end
