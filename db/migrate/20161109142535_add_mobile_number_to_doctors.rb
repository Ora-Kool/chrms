class AddMobileNumberToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :mobile_number, :string
  end
end
