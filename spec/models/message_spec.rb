require 'rails_helper'
require 'rspec/its'

RSpec.describe Message, :type => :model do

  describe Message do

    let(:user) { Factory.create(:user) }
    before { @message = user.messages.build(:message => "Lorem ipsum", :to => "6133042365", :from => "6138584587") }

    subject { @message }

    it { should respond_to(:message) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
    its(:user) { should == user }

    it { should be_valid }

    describe "when user_id is not present" do
      before { @message.user_id = nil }
      it { should_not be_valid }
    end

    describe "with blank content" do
      before { @message.message = " " }
      it { should_not be_valid }
    end

    describe "with content that is way too long" do
      before { @message.message = "a" * 640 }
      it { should_not be_valid }
    end

  end
end


# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  message    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  contact_id :integer
#  phone      :decimal(, )
#  to         :decimal(, )
#  from       :decimal(, )
#
# Indexes
#
#  index_messages_on_user_id_and_created_at  (user_id,created_at)
#
