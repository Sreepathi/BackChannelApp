require 'test_helper'

class NewsignupTest < ActionDispatch::IntegrationTest


 test "valid inputs" do
  visit " " #URL
   fill_in "name", :with => "Abhimanyu"
   fill_in "email", :with => "abhi@abhi.com"
   fill_in "password", :with => "pass123"
   fill_in "password_confirmation", with => "pass123"
   click_button "Sign up"
   assert_contain "User was successfully created."
 end


  test "existing username or email" do
   User.create!(:name => "Abhimanyu", :email => "abhi@abhi.com", :password => "pass")
   visit " " #URL
   fill_in "name", :with => "Abhimanyu"
   fill_in "email", :with => "abhi@abhi.com"
   fill_in "password", :with => "pass123"
   fill_in "password_confirmation", with => "pass123"
   click_button "Sign up"
   assert_contain "Username already exists"
  end
end
