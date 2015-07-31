class Chat < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage/
end
