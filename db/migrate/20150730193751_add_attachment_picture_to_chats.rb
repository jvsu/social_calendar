class AddAttachmentPictureToChats < ActiveRecord::Migration
  def self.up
    change_table :chats do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :chats, :picture
  end
end
