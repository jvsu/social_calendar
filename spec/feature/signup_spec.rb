require 'spec_helper'
require 'rails_helper'

feature "SignUp" do 
	scenario "Create New Account" do 
		visit "/users/sign_up"
		fill_in "user[first_name]", :with=>"joe"
		fill_in "user[last_name]", :with=>"super"
		fill_in "user[email]", :with=>"jvsu@yahoo.com"
		fill_in "user[user_name]", :with=>"joe"
		fill_in "user[birthday]", :with=>I18n.l(Date.today, format: '%Y-%m-%d')
		fill_in "user[password]", :with=>'aaaaaaaa'
		fill_in "user[password_confirmation]", :with=>"aaaaaaaa"
		click_button "Sign up"
		expect(page).to have_content("Home#calendar")
	end


end