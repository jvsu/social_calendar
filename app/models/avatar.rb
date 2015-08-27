class Avatar < ActiveRecord::Base
  belongs_to :user
  has_attached_file :profile_pic
  validates_attachment_content_type :profile_pic, :content_type => /\Aimage/
end
