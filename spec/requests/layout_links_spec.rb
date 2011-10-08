require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should render_template('pages/home')
   end

  it "should have a Contact page at '/contact'" do
    get '/createadmin'
    response.should render_template('users/new')
  end

  it "should have an Search page at '/search'" do
     get '/search'
      response.should render_template('lookups/new')

   end
end
