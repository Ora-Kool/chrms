class AddIndexToStaffsEmail < ActiveRecord::Migration[5.0]
  def change
  	add_index :staffs, :email, unique: true
  end
end
