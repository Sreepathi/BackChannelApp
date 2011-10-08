require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest


   test "Valid username and password" do
     User.create!(:name => "Abhi", :email => "abhi@abhi.com", :password => "password")
     visit "/singin"
     fill_in "email", :with => "abhi@abhi.com"
     fill_in "password", :with => "password"
     click_button "Sign In"
     assert_contain "Sign out"
   end

   test "Invalid username and password" do
     User.create!(:name => "Abhi", :email => "abhi@abhi.com", :password => "password")
     visit "/singin"
     fill_in "email", :with => "abhi@abhi.com"
     fill_in "password", :with => "passwordwrong"
     click_button "Sign In"
     assert_contain "Invalid email/password combination."
   end

end
