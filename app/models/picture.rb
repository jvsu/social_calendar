class Picture < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpeg", "image/gif", "image/png","image/jpg"]
  validates :user_id, :image, presence:true
  has_many :groups
  has_many :events
end
