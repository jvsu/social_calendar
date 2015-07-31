require 'spec_helper'
require 'rails_helper'

feature "Login" do 
	before(:each){
		User.new(first_name:"joseph",last_name:"su",email:"joe@yahoo.com", user_name:"joe",gender:"male",birthday:'03/12/1989', password:"aaaaaaaa").save
	}

	scenario "Successful Login" do 
		visit '/'
		within("#email") do 
			fill_in "user[email]", :with=>"joe@yahoo.com"		
		end
		within("#password") do 
			fill_in "user[password]", :with=>"aaaaaaaa"
		end
		within('#sub') do 
			click_button "Sign in"
		end
		expect(page).to have_content("Homes#calendar")
	end

end
