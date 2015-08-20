class AddNewPendingFriendRequest < ActiveRecord::Migration
  def change
  	add_column :friend_requests, :pending_confirmer,:boolean
  	rename_column :friend_requests, :pending,:pending_requester
  end
end
