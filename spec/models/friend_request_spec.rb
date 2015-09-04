require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new record if inputs are valid" do 
  	fr = FriendRequest.new(user_id:1, friend_id:1, pending_requester:true, pending_confirmer:true)
  	expect(fr).to be_valid

  end

  it "doesn't create a new record if user_id is missing" do 
  	fr = FriendRequest.new(user_id:'', friend_id:1, pending_requester:true, pending_confirmer:true)
  	expect(fr).to be_invalid
  end

  it "doesn't create a new record if friend_id is missing" do 
  	fr = FriendRequest.new(user_id:1, friend_id:'', pending_requester:true, pending_confirmer:true)
  	expect(fr).to be_invalid
  end

  it "doesn't create a new record if pending_requester is missing" do 
  	fr = FriendRequest.new(user_id:1, friend_id:1, pending_requester:'', pending_confirmer:true)
  	expect(fr).to be_invalid
  end

  it "doesn't create a new record if pending_confirmer is missing" do 
  	fr = FriendRequest.new(user_id:1, friend_id:1, pending_requester:true, pending_confirmer:'')
  	expect(fr).to be_invalid
  end
end
