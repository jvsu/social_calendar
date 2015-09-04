require 'rails_helper'

RSpec.describe Emetric, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new record if the data is correct" do 
  	metric = Emetric.new(event_id:1)
  	expect(metric).to be_valid
  end

  it "doesn't create a new record if event_id is missing" do 
  	metric = Emetric.new(event_id:'')
  	expect(metric).to be_invalid
  end

  it "updates save_num if input is a number"

  it "updates join_num if input is a number"

  it "updates like_num if input is a number"

  it "doesn't update save_num if input is not a number"


  it "doesn't update join_num if input is not a number"


  it "doesn't update like_num if input is not a number"

end
