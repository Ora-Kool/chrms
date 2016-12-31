class AddLatitudeAndLongitudeToDoctor < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :latitude, :float
    add_column :doctors, :longitude, :float
  end
end
