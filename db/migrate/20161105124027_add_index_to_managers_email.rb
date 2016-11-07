class AddIndexToManagersEmail < ActiveRecord::Migration[5.0]
  def change
  	add_index :managers, :email, unique: true
  end
end
