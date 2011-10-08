require 'spec_helper'

describe "Searchings" do
  describe "searching resuts" do
    it "should make a new search" do
        lambda do
          visit '/search'
          fill_in "keywords",         :with => "rails"
          fill_in "username",        :with => "user"
          click_button
          response.should render_template('lookups/show')
        end.should change(Lookup, :count).by(1)
      end
  end

  describe "empty searching resuts" do
    it "should make a new search" do
        lambda do
          visit '/search'
          fill_in "keywords",         :with => ""
          fill_in "username",        :with => ""
          click_button
          response.should render_template('lookups/show')
        end.should change(Lookup, :count).by(1)
      end
  end
end
