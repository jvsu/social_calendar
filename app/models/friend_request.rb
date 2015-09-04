class FriendRequest < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :friend_id, :pending_requester, :pending_confirmer, presence:true
  
end
