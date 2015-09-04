require 'rails_helper'

RSpec.describe Circle, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  it "creates a new record when all credentials are valid" do 
  	circle = Circle.new(user_id:1, name:"fitness pals")
  	expect(circle).to be_valid
  end

  it "doesn't create a new record if name is missing" do 
  	circle = Circle.new(user_id:1, name:"")
  	expect(circle).to be_invalid

  end

  it "doesn't create a new record if user_id is missing" do
  	circle = Circle.new(user_id:'', name:"fitness pals")
  	expect(circle).to be_invalid
  end
end
