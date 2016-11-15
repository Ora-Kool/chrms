class AddSpecialityToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :speciality, :string
  end
end
