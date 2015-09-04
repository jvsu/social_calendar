require 'rails_helper'

RSpec.describe Friend, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new record if all credentials provided" do 
  	friend = Friend.new(user_id:1, circle_id:1, friend_num:1)
  	expect(friend).to be_valid

  end

  it "doesn't create a new record if user_id is missing" do 
  	friend = Friend.new(user_id:'', circle_id:1, friend_num:1)
  	expect(friend).to be_invalid
  end


  it "doesn't create a new record if circle_id is missing" do 
  	friend = Friend.new(user_id:1, circle_id:'', friend_num:1)
  	expect(friend).to be_invalid
  end


  it "doesn't create a new record if friend_num is missing" do 
  	friend = Friend.new(user_id:1, circle_id:1, friend_num:'')
  	expect(friend).to be_invalid
  end
end
