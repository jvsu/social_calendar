class AddAttachmentPicToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :events, :pic
  end
end
