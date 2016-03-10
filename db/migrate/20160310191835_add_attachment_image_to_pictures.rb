class AddAttachmentImageToPictures < ActiveRecord::Migration
  def self.up
    change_table :vasari_pictures do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :vasari_pictures, :image
  end
end
