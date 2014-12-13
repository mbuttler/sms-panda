require 'rails_helper'

RSpec.describe User, :type => :model do
  
  before(:each) do
    @attr = { :name => "Example Dan", 
              :email => "user@example.com",
              :password => "foobarfoobar",
              :password_confirmation => "foobarfoobar",
              :phone => "6136996738"
           }
  end

  it "should create a new instance given valid attributes submitted" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require a phone numba" do 
    no_email_user = User.new(@attr.merge(:phone => ""))
    no_email_user.should_not be_valid
  end

  it "should require an email, srsly wtf" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase 
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalidinvalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 129
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
  
    describe "has_password? method" do

      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_truthy
      end

      it "shoudl be false if the passwords don't match" do
        @user.has_password?("invalidinvalid").should be_falsey
      end
    end

    describe "authenticate method" do
      
      it "should return nil on email/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_password_user.should be_nil
      end

      it "should return nil for an email address with no user" do
        nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
        nonexistent_user.should be_nil
      end

      it "should return the user on email/password match" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end
    end
  end

  describe "admin attribute" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should respond to admin" do
      @user.should respond_to(:admin)
    end

    it "should not be an admin by default" do
      @user.should_not be_admin
    end

    it "should be convertible to an admin" do
      @user.toggle!(:admin)
      @user.should be_admin
    end
  end

  describe "message associations" do

    before(:each) do
      @user = User.create(@attr)
      @mp1 = Factory(:message, :user => @user, :created_at => 1.day.ago, :to => Factory.next(:to), :from => Factory.next(:from) )
      @mp2 = Factory(:message, :user => @user, :created_at => 1.hour.ago, :to => Factory.next(:to), :from => Factory.next(:from) )
    end

    it "should have a messages attribute" do
      @user.should respond_to(:messages)
    end

    it "should have the right messages in the right order" do
      @user.messages.should == [@mp2, @mp1]
    end

    it "should destroy associated messages" do
      @user.destroy
      [@mp1, @mp2].each do |message|
        Message.find_by_id(message.id).should be_nil
      end
    end

    describe "status feed" do 

      it "should have a feed" do 

        @user.should respond_to(:feed)
      end

      it "should include the user's messages" do
        @user.feed.include?(@mp1).should be_truthy
        @user.feed.include?(@mp2).should be_truthy
      end

      it "should not include a different user's messages" do 
        mp3 = Factory(:message, :user => Factory(:user, :email => Factory.next(:email), :phone => Factory.next(:phone) ))
        @user.feed.include?(mp3).should be_falsey
      end
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean          default(FALSE)
#  phone              :decimal(, )
#  email_fwd          :boolean          default(FALSE)
#  billing_id         :integer
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
