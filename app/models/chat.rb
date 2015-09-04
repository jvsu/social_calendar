class Chat < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_attached_file :picture
  validates_attachment_content_type :picture, allow_blank:true, :content_type => ["image/jpeg", "image/gif", "image/png","image/jpg"]
  validates_presence_of :message, :unless=> :picture?
  validates :user_id, :event_id, presence:true

end
