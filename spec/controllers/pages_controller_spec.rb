require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  render_views

  before(:each) do
    @base_title = "SMS Panda | "
  end

  describe "GET home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get 'home'
      expect(response.body).to have_title( @base_title + "Home")
    end
  end

  describe "GET 'contactus'" do
    it "should be successful" do
      get 'contactus'
      expect(response).to be_success
    end

    it "should have the right title" do
      get 'contactus'
      expect(response.body).to have_title(@base_title + "Contact Us")
    end
  end

  describe "GET about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get 'about'
      expect(response.body).to have_title(@base_title + "About")
    end
  end
end
