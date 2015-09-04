require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new entry if the correct credentials are inputted" do
  	event = Event.new(description:"something cool", date:"3/12/15",time:"4:00PM", join_threshold:3, circle_id:1, user_id:1, picture_id:1)
  	expect(event).to be_valid
  end

  it "doesn't create a new entry if description is not included" do 
  		event = Event.new(description:"", date:"3/12/15",time:"4:00PM", join_threshold:3, circle_id:1, user_id:1, picture_id:1)
  		expect(event).to be_invalid
  end

  it "doesn't create a new entry if date is not included" do 
  	event = Event.new(description:"something cool", date:"",time:"4:00PM", join_threshold:3, circle_id:1, user_id:1, picture_id:1)
  	expect(event).to be_invalid
  end

  it "doesn't create a new entry if time is not included" do 
  	event = Event.new(description:"something cool", date:"3/12/15",time:"", join_threshold:3, circle_id:1, user_id:1, picture_id:1)
  	expect(event).to be_invalid
  end

  it "doesn't create a new entry if join_threshold is not included" do 
  	event = Event.new(description:"something cool", date:"3/12/15",time:"4:00PM", join_threshold:"", circle_id:1, user_id:1, picture_id:1)
  	expect(event).to be_invalid

  end

  it "doesn't create a new entry if circle_id is not included" do 
  	event = Event.new(description:"something cool", date:"3/12/15",time:"4:00PM", join_threshold:3, circle_id:'', user_id:1, picture_id:1)
  	expect(event).to be_invalid
  end

  it "doesn't create a new entry if user_id is not included" do 
  	event = Event.new(description:"something cool", date:"3/12/15",time:"4:00PM", join_threshold:3, circle_id:1, user_id:'', picture_id:1)
  	expect(event).to be_invalid
  end

  it "doesn't create a new entry if picture_id is not included" do 
  	event = Event.new(description:"something cool", date:"3/12/15",time:"4:00PM", join_threshold:3, circle_id:1, user_id:1, picture_id:'')
  	expect(event).to be_invalid
  end

  it "doesn't create a new entry if join_threshold is not a number" do 
  		event = Event.new(description:"something cool", date:"3/12/15",time:"4:00PM", join_threshold:'a', circle_id:1, user_id:1, picture_id:1)
  		expect(event).to be_invalid
  end


end
