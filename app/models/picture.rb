class Picture < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage/
  has_many :groups
  has_many :events
end
