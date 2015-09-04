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
  validates :description, :date, :time, :join_threshold, :circle_id, :user_id,:picture_id, presence:true
  validates :join_threshold, numericality:true


end
