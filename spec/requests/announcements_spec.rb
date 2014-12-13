require 'rails_helper'

RSpec.describe "Announcements", :type => :request do
  it "displays active announcements" do
    Announce.create! message: "Hello world", starts_at: 1.hour.ago, ends_at: 1.hour.from_now
    Announce.create! message: "Upcoming", starts_at: 10.minutes.from_now, ends_at: 1.hour.from_now
    visit root_path
    page.should have_content("Hello world")
    page.should_not have_content("Upcoming")
    click_on "hide announcement"
    page.should_not have_content("Hello world")
  end

#not working but working?
  # it "stays on page when hiding announcement with javascript", js: true do
  #   Announce.create! message: "Hello world", starts_at: 1.hour.ago, ends_at: 1.hour.from_now
  #   visit root_path
  #   page.should have_content("Hello world")
  #   expect { click_on "hide announcement" }.to_not change { page.response_headers }
  #   page.should_not have_content("Hello world")
  # end
end
