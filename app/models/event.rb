class Event < ActiveRecord::Base
  belongs_to :circle
  belongs_to :user
  belongs_to :picture
  has_one :emetrics
  has_many :chats
  has_many :likes
  has_many :joins
  has_many :saves
  has_many :invitations
  has_attached_file :pic
  validates_attachment_content_type :pic, :content_type => /\Aimage/
end
