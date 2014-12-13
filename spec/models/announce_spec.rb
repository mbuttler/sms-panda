require 'rails_helper'

RSpec.describe Announce, :type => :model do
  it "has current scope" do
    past = Announce.create! message: "hey", starts_at: 1.day.ago, ends_at: 1.hour.ago
    current = Announce.create! message: "hey", starts_at: 1.hour.ago, ends_at: 1.day.from_now
    upcoming = Announce.create! message: "hey", starts_at: 1.hour.from_now, ends_at: 1.day.from_now
    Announce.current.should eq([current])
  end

   it "does not include ids passed in to current" do
    current1 = Announce.create! message: "hey", starts_at: 1.hour.ago, ends_at: 1.day.from_now
    current2 = Announce.create! message: "hey", starts_at: 1.hour.ago, ends_at: 1.day.from_now
    Announce.current([current2.id]).should eq([current1])
  end

  it "includes current when nil is passed in" do
    current = Announce.create! message: "hey", starts_at: 1.hour.ago, ends_at: 1.day.from_now
    Announce.current(nil).should eq([current])
  end
end

# == Schema Information
#
# Table name: announces
#
#  id         :integer          not null, primary key
#  message    :text
#  starts_at  :datetime
#  ends_at    :datetime
#  created_at :datetime
#  updated_at :datetime
#
