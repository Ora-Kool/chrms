class AddGenderToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :gender, :string
  end
end
