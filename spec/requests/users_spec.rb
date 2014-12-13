require 'rails_helper'

RSpec.describe "User", :type => :request do
  describe "GET /User" do
    describe "signup" do

      describe "failure" do
        it "should not make a new user" do
          visit signup_path
          expect { click_button "Sign up" }.not_to change(User, :count)
        end
      end
    end
#TODO wtf
    # describe "sign in/out" do
    #   it "should not sign a user in" do
    #     visit signin_path
    #     fill_in 'Email',       :with => ""
    #     fill_in 'Password',    :with => ""
    #     click_button "Sign in"
    #     expect(response).to have_selector('error')
    #     # response.should have_selector("error", :content => "Invalid email or password combination")
    #   end
    # end

    # describe "success" do
    #   it "should sign a user in and out" do
    #     user = Factory(:user)
    #     visit signin_path
    #     fill_in 'Email',       :with => user.email
    #     fill_in 'Password',    :with => user.password
    #     click_button "Sign in"
    #     controller.should be_signed_in
    #     click_link "Sign out"
    #     controller.should_not be_signed_in
    #   end
    # end
  end
end
