class AddEducationToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :education, :string
  end
end
