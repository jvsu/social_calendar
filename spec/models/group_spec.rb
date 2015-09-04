require 'rails_helper'

RSpec.describe Group, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates group with the right credentials" do 
  	group = Group.new(picture_id:1, name:"Travel")
  	expect(group).to be_valid
  end

  it "doesnt' create a new entry if picture_id isn't included" do 
  	group = Group.new(picture_id:'', name:"Travel")
  	expect(group).to be_invalid
  end

  it "doesn't create a group if name is not included" do 
  	group = Group.new(picture_id:1, name:'')
  	expect(group).to be_invalid
  end

end
