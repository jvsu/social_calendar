class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :circle
  validates :user_id, :circle_id, :friend_num, presence:true
end
