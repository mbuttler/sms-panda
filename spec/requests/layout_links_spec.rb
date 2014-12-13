require 'rails_helper'

RSpec.describe "LayoutLinks" do

	before(:each) do
    	@base_title = "SMS Panda | "
  end

	describe "GET layout links" do

    it "should have a Home page at '/'" do
      get '/'
      assert_select "title", @base_title + "Home"
    end

    it "should have a Contact page at '/contactus'" do
    	get '/contactus'
      	assert_select "title", @base_title + "Contact Us"
    end

   	it "should have an About page at '/about'" do
  		get '/about'
      	assert_select "title", @base_title + "About"
  	end

  	it "should have a signup page at /signup'" do 
  		get '/signup'
  		assert_select "title", @base_title + "Sign up"
  	end

# #TODO
# 	  	it "should have the right links on the layout" do
# 	  		visit root_path
# 	  		click_link('About')
#         save_and_open_page
# 	  		assert_select "title", @base_title + "About"
# 	  	end
    # describe "when not signed in" do
    #   it "should have a signin link" do
    #     visit root_path
    #     response.should have_link("Sign in", :href => signin_path )
    #   end
    # end

	  # describe "when signed in" do

	  #   before(:each) do
	  #     @user = Factory(:user)
	  #     visit signin_path
	  #     fill_in "Email",    :with => @user.email
	  #     fill_in "Password", :with => @user.password
	  #     click_button "Sign in"
	  #   end

	  #   it "should have a signout link" do
	  #     get "/" 
	  #     response.should have_selector("Sign out", :href => signout_path)
	  #   end

	  #   it "should have a profile link" do
	  #   	visit root_path
	  #   	response.should have_link("Profile", :href => user_path(@user))
	  # 	end
   #  end
  end	
end

# RSpec.describe "Static pages" do 

#   subject { page }

#   before(:each) do
#       @base_title = "SMS Panda | "
#   end


#   it "should have the right links on the layout" do
#     visit root_path
#     click_link "About"
#     page.should have_title(@base_title + "About Us")
#     click_link "Contact Us"
#     page.should have_title(base title + "Contact Us")
#     click_link "Home"
#     click_link "Sign up now!"
#     page.should have_title(base title + "Sign up")
#   end
# end