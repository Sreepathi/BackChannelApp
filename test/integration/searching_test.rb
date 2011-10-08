require 'test_helper'

class SearchingTest < ActionDispatch::IntegrationTest


  test "search found" do
    Micropost.create!(:content => "app", :user_id => 2)
    visit "/lookups/new"
    fill_in "keywords", :with => "app"
    fill_in "username", :with => "Abhimanyu"
    click_button "Search"
    assert_contain "app"
   end
end
