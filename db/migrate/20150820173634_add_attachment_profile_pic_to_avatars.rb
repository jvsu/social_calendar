class AddAttachmentProfilePicToAvatars < ActiveRecord::Migration
  def self.up
    change_table :avatars do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :avatars, :profile_pic
  end
end
