require 'rails_helper'

RSpec.describe Chat, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new entry if message and picture is provided" do 
  	chat = Chat.new(event_id:1, user_id:1,message:'Hello', picture_file_name:"cray.jpg", picture_content_type:'image/jpg', picture_file_size:121743, picture_updated_at:'2015-08-03 16:24:38 UT')
  	expect(chat).to be_valid
  end

  it "creates a new entry if only message is included" do 
  	chat = Chat.new(event_id:1, user_id:1,message:'Hello')
  	expect(chat).to be_valid

  end

  it "doesn't create a new entry if picture and message is blank" do 
  	chat = Chat.new(event_id:1, user_id:1)
  	expect(chat).to be_invalid
  end

  it "create a new entry if message is blank and picture is included" do 
  	chat = Chat.new(event_id:1, user_id:1,message:'', picture_file_name:"cray.jpg", picture_content_type:'image/jpg', picture_file_size:121743, picture_updated_at:'2015-08-03 16:24:38 UT')
  	expect(chat).to be_valid
  end
end
