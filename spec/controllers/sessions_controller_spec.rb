require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  render_views

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should have the right title" do
      get :new
      expect(response.body).to have_title("Sign in")
    end
  end

  describe "POST 'create'" do

    describe "invalid signin" do

      before(:each) do
        @attr = { :email => "al@example.com", :password => "invalid",  :format => 'js' }
      end

      # it "should re-render the new page" do
      #   post :create, :session => @attr
      #   response.should render_template('new')
      # end

      it "should have the right title" do
        post :create, :session => @attr
        expect(response.body).to have_title("Sign in")
      end

      it "should have a flash message" do
        post :create, :session => @attr
        expect(flash.now[:error]).to match(/Invalid email or password combination/)
      end
    end

    describe "with valid email and password" do

      before(:each) do
        @user = Factory(:user)
        @attr = { :email => @user.email, :password => @user.password }
      end

      it "should sign the user in" do
        post :create, :session => @attr
        expect(controller.current_user).to eq(@user)
        expect(controller).to be_signed_in
      end

      it "should redirect to the user show page" do 
        post :create, :session => @attr
        expect(response).to redirect_to(user_path(@user))
      end
    end
  end

  describe "DELETE 'destroy'" do

    it "should sign a user out" do
      test_sign_in(Factory(:user))
      delete :destroy
      expect(controller).to_not be_signed_in
      expect(response).to redirect_to(root_path)
    end
  end
end
