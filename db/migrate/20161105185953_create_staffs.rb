class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.string :remember_digest
      t.string :password_digest

      t.timestamps
    end
  end
end
