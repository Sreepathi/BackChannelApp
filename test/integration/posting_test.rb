require 'test_helper'

class PostingTest < ActionDispatch::IntegrationTest


  test "successful posting" do
     visit "/singin"      #url for post
     fill_in "content", :with => "something"
     click_button "Submit"
     assert_contain "Micropost created"
  end

  test "unsuccessful posting" do
      visit ""   #URL for Post
      fill_in "content", :with => ""
      click_button "Submit"
      assert_contain "Field is empty"
  end
end
