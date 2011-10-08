require 'spec_helper'

describe "Signins" do
  describe "success" do

      it "should login" do
        lambda do
          visit '/signin'
          fill_in "Email",        :with => "user@example.com"
          fill_in "Password",     :with => "foobar"

          click_button
          response.should render_template('sessions/new')
        end.should change(User, :count).by(0)
      end
    end
  end

describe "Users" do

  describe "signup" do

    describe "log in failure" do

      it "should not log in" do
        lambda do
          visit '/signin'

          fill_in "Email",        :with => ""
          fill_in "Password",     :with => ""

          click_button
          response.should render_template('sessions/new')

        end.should_not change(User, :count)
      end
    end
  end
end
