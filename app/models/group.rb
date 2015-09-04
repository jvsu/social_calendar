class Group < ActiveRecord::Base
  belongs_to :picture
  validates :picture_id, :name, presence:true
end
