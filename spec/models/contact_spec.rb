require 'rails_helper'
require 'rspec/its'

RSpec.describe Contact, :type => :model do

  describe Contact do

    let(:user) { Factory.create(:user) }
    before { @contact = user.contacts.build(:name => "Lorem ipsum", :phone => "6133042365") }

    subject { @contact }

    it { should respond_to(:name) }
    it { should respond_to(:phone) }
    it { should respond_to(:user) }
    its(:user) { should == user }

    it { should be_valid }

    describe "when contact_id is not present" do
      before { @contact.user_id = nil }
      it { should_not be_valid }
    end

    describe "with blank phone" do
      before { @contact.phone = " " }
      it { should_not be_valid }
    end

    # describe "with content that is way too long" do
    #   before { @contact.contact = "a" * 640 }
    #   it { should_not be_valid }
    # end

  end
end

# RSpec.describe Contact, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  phone      :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#
# Indexes
#
#  index_contacts_on_user_id  (user_id)
#
