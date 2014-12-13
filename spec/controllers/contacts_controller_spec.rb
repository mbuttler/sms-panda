require 'rails_helper'

RSpec.describe ContactsController, :type => :controller do
  render_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end
# # TODO no Couldn't find Message wit 'id'=1
#     it "should deny access to 'destroy'" do
#       delete :destroy, :id => 1
#       response.should redirect_to(signin_path)
#     end
  end

  describe "GET 'index'" do

    describe "for non-signed-in users" do 
      it "should deny access" do
        get :index
        expect(response).to redirect_to(signin_path)
        expect(flash[:notice]).to match(/Please Sign in/i)
      end
    end

    describe "for signed-in users" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
      end

      it "should be successful" do
        get :index
        expect(response).to be_success
      end

      it "should have the right title" do
        get :index
        expect(response.body).to have_title("SMS Panda | All Pandas")
      end
    end
  end

  describe "validations" do

    before(:each) do
      @user = Factory(:user)
      @attr = { :name => "Hi test 1.", :phone => 6133042666.0 }
    end

    it "should create a new instance given valid attributes" do
      @user.contacts.create!(@attr)
    end

    describe "user associations" do

      before(:each) do
        @contact = @user.contacts.create(@attr) 
      end

      it "should have a user attribute" do
        @contact.should respond_to(:user)
      end

      it "should have the right associated user" do
        @contact.user_id.should == @user.id
        @contact.user.should == @user
      end
    end

    # describe "for an unauthorized user" do 

    #   before(:each) do
    #     wrong_user = Factory(:user, :email => Factory.next(:email), :phone => Factory.next(:phone))
    #     test_sign_in(wrong_user)
    #     @contact = Factory(:contact, :user => @user)
    #   end

    #   it "should deny access" do 
    #     get :show, :id => @contact
    #     response.should redirect_to(root_path)
    #   end

    #   it "should not render the content of the other user's contact" do 
    #     get :show, :id => @contact
    #     response.should_not render_template('messages/show')
    #   end
    # end
  end


  # describe ".sms_create" do 
  #   it "should create a message" do
  #     message = MessagesController.new
  #     message.sms_create("Eyo", 6133042365.0)
  #     expect(message.sms_create).to match(/SMS in I-dont-know-lol/)
  #   end
  # end

  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    # describe "failure with content" do

    #   before(:each) do 
    #     @attr = { :phone => " " }
    #   end

    #   it "should not create a contact" do
    #     lambda do
    #       post :create, :contact => @attr 
    #     end.should_not change(Contact, :count)
    #   end

    #   it "should render the create new contact page" do
    #     post :create, :contact => @attr
    #     response.should render_template('contacts/new')
    #   end
    # end

    describe "success" do

      before(:each) do
        @attr = { :contact => "Alex ", :phone => 6133045566.0 }
      end

      it "should create a contact" do 

        lambda do
          post :create, :contact => @attr
        end.should change(Contact, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :contact => @attr 
        # response.should render_template('contacts/show')
        expect(response).to redirect_to @contacts
      end

      it "should have a flash contact" do
        post :create, :contact => @attr
        flash[:success].should match(/panda friend created!/i)
      end
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do 

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email), :phone => Factory.next(:phone))
        test_sign_in(wrong_user)
        @contact = Factory(:contact, :user => @user)
      end

      # it "should deny access" do 
      #   delete :destroy, :id => @contact
      #   # response.should redirect_to @contacts
      #   response.should redirect_to('contacts/index')
      # end

    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        @contact = Factory(:contact, :user => @user)
      end

      it "should destroy the micripost" do
        lambda do
          delete :destroy, :id => @contact
        end.should change(Contact, :count).by(-1)
      end
    end
  end
end