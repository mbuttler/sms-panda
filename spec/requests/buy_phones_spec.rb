require 'rails_helper'

RSpec.describe "BuyPhones", :type => :request do
  describe "GET /buy_phones" do
    it "works! " do
      get buy_phones_path
      expect(response).to have_http_status(200)
    end
  end
end
