class AddAttachmentPhotoToCocktails < ActiveRecord::Migration
  def self.up
    change_table :cocktails do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :cocktails, :photo
  end
end
