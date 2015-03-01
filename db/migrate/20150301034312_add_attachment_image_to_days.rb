class AddAttachmentImageToDays < ActiveRecord::Migration
  def self.up
    change_table :days do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :days, :image
  end
end
