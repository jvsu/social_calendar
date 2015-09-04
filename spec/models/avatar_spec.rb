require 'rails_helper'

RSpec.describe Avatar, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new record if all the correct information is given" do 
  	avatar = Avatar.new(user_id:1, profile_pic_file_name:"cray.jpg", profile_pic_content_type:'image/jpg', profile_pic_file_size:121743,profile_pic_updated_at:'2015-08-03 16:24:38 UT')
  	expect(avatar).to be_valid
end

  it "doesn't create a new record if user_id is missing" do 
  		avatar = Avatar.new(user_id:'', profile_pic_file_name:"cray.jpg", profile_pic_content_type:'image/jpg', profile_pic_file_size:121743,profile_pic_updated_at:'2015-08-03 16:24:38 UT')
  		expect(avatar).to be_invalid
  end

  it "doesn't create a new record if a picture is missing" do 
  	avatar = Avatar.new(user_id:1)
  	expect(avatar).to be_invalid

  end

  it "doesn't create a new record if it's the wrong picture format" do 
  	avatar = Avatar.new(user_id:1, profile_pic_file_name:"cray.tiff", profile_pic_content_type:'image/tiff', profile_pic_file_size:121743,profile_pic_updated_at:'2015-08-03 16:24:38 UT')
  	expect(avatar).to be_invalid
  end
end
