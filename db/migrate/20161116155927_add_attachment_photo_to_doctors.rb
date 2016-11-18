class AddAttachmentPhotoToDoctors < ActiveRecord::Migration
  def self.up
    change_table :doctors do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :doctors, :photo
  end
end
