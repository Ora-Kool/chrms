class AddIdCardNumberToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :id_card_number, :integer
  end
end
