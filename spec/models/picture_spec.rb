require 'rails_helper'

RSpec.describe Picture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a record when all information is valid" do 
  	picture = Picture.new(user_id:1,image_file_name:"cray.jpg", image_content_type:'image/jpg', image_file_size:121743,image_updated_at:'2015-08-03 16:24:38 UT')
  	expect(picture).to be_valid
  end

  it "doesn't create a record if user_id is not present" do
  	picture = Picture.new(user_id:'',image_file_name:"cray.jpg", image_content_type:'image/jpg', image_file_size:121743,image_updated_at:'2015-08-03 16:24:38 UT')
  	expect(picture).to be_invalid
  end

  it "doesn't create a record if image is not included" do
  	picture = Picture.new(user_id:1)
  	expect(picture).to be_invalid
  end

  it "doesn't crete a record if the image is the wrong file type" do 
  	picture = Picture.new(user_id:1,image_file_name:"cray.tiff", image_content_type:'image/tiff', image_file_size:121743,image_updated_at:'2015-08-03 16:24:38 UT')
  	expect(picture).to be_invalid
  end
end
