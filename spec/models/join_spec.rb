require 'rails_helper'

RSpec.describe Join, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "creates a new record if all credentials are given" do 
  	join = Join.new(event_id:1, user_id:1)
  	expect(join).to be_valid
  end

  it "doesn't create a new record if user_id is missing" do 
  	join = Join.new(event_id:1, user_id:'')
  	expect(join).to be_invalid
  end

  it "doesn't create a new record if event_id is missing" do 
  	join = Join.new(event_id:'', user_id:1)
  	expect(join).to be_invalid
  end
end
