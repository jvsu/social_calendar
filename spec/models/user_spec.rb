require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new user when all the proper info is inputted" do 
  	user = User.new(first_name:"joseph",last_name:"su",email:"jo@yahoo.com", user_name:"joe",gender:"male",birthday:'03/12/1989', password:"aaaaaaaa")
  	expect(user).to be_valid
  end

  it "does not create a user if all inputs are blank" do 
	user = User.new(first_name:"",last_name:"",email:"", user_name:"",gender:"",birthday:"", password:"")
  	expect(user).to be_invalid
  end

  it "does not create a user if first_name is blank" do 
  	user = User.new(first_name:"",last_name:"su",email:"joe@yahoo.com", user_name:"joe",gender:"male",birthday:'03/12/1989', password:"aaaaaaaa")
  	expect(user).to be_invalid
  end

  it "does not create a user if last_name is blank" do 
  	user = User.new(first_name:"joseph",last_name:"",email:"joe@yahoo.com", user_name:"joe",gender:"male",birthday:'03/12/1989', password:"aaaaaaaa")
  	expect(user).to be_invalid

  end
  
  it "does not create a user if user_name is blank" do
  	user = User.new(first_name:"joseph",last_name:"su",email:"joe@yahoo.com", user_name:"",gender:"male",birthday:'03/12/1989', password:"aaaaaaaa")
  	expect(user).to be_invalid
  end

  it "does not create a user if email is blank" do
  	user = User.new(first_name:"joseph",last_name:"su",email:"", user_name:"joe",gender:"male",birthday:'03/12/1989', password:"aaaaaaaa")
  	expect(user).to be_invalid
  end

  it "does not create a user if birthday is blank" do
  	user = User.new(first_name:"joseph",last_name:"su",email:"joe@yahoo.com", user_name:"joe",gender:"male",birthday:'', password:"aaaaaaaa")
  	expect(user).to be_invalid
  end

  it "does not create a user if password is blank" do
  	user = User.new(first_name:"joseph",last_name:"su",email:"joe@yahoo.com", user_name:"joe",gender:"male",birthday:'03/12/1989', password:"")
  	expect(user).to be_invalid

  end

  it "does not create a user if email is not valid" do
  	user = User.new(first_name:"joseph",last_name:"su",email:"joe", user_name:"joe",gender:"male",birthday:'03/12/1989', password:"aaaaaaaa")
  	expect(user).to be_invalid
  end
   
  

end
