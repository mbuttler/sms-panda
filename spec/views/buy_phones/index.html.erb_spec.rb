require 'rails_helper'

RSpec.describe "buy_phones/index", :type => :view do
  before(:each) do
    assign(:buy_phones, [
      BuyPhone.create!(),
      BuyPhone.create!()
    ])
  end

  it "renders a list of buy_phones" do
    render
  end
end
