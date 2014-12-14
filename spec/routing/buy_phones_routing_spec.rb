require "rails_helper"

RSpec.describe BuyPhonesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/buy_phones").to route_to("buy_phones#index")
    end

    it "routes to #new" do
      expect(:get => "/buy_phones/new").to route_to("buy_phones#new")
    end

    it "routes to #show" do
      expect(:get => "/buy_phones/1").to route_to("buy_phones#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/buy_phones/1/edit").to route_to("buy_phones#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/buy_phones").to route_to("buy_phones#create")
    end

    it "routes to #update" do
      expect(:put => "/buy_phones/1").to route_to("buy_phones#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/buy_phones/1").to route_to("buy_phones#destroy", :id => "1")
    end

  end
end
