class AddMobileNumber2ToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :mobile_number2, :string
  end
end
