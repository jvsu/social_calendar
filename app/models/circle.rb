class Circle < ActiveRecord::Base
  belongs_to :user
  has_many :friends
  has_many :events
  validates :user_id, :name, presence:true
end
