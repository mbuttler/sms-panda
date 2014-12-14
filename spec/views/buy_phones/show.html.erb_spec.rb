require 'rails_helper'

RSpec.describe "buy_phones/show", :type => :view do
  before(:each) do
    @buy_phone = assign(:buy_phone, BuyPhone.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
