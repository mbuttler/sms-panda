require 'rails_helper'

RSpec.describe "Messages", :type => :request do
  # describe "GET /messages" do
  #   it "should redirect after create" do
  #     get messages_path
  #     expect(response).to have_http_status(302)
  #   end
  # end

  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in "Email",       :with => user.email
    fill_in "Password",    :with => user.password
    click_button "Sign in"
  end

  describe "creation" do #in the beginning . . . 

    describe "failure" do

      it "should not make a new message" do 
        lambda do
          visit root_path
          fill_in :message_message, :with => ""
          click_button "Submit"
          # expect(response).to render_template('pages/home')
          # expect(response).to match("div#error_explanation")
        end.should_not change(Message, :count)
      end
    end

    # describe "success" do

    #   it "should make a new message" do 

    #     content = "Lorem ipsum dolor sit amet messages spec request test"
         
    #       visit root_path
    #       fill_in :message_message, :with => content
    #       click_button "Submit"
    #       # expect(response.body).to have_content(content)
    #     expect(response).to change(Message, :count).by(1)
    #   end
    # end
  end
end

