require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new record if all information is provided" do 
  	like = Like.new(user_id:1, event_id:1)
  	expect(like).to be_valid
  end

  it "doesn't create a new record if user_id is missing" do 
  	like = Like.new(user_id:'', event_id:1)
  	expect(like).to be_invalid
  end

  it "doesn't create a new record if event_id is missing" do 
  	like = Like.new(user_id:1, event_id:'')
  	expect(like).to be_invalid
  end
end
