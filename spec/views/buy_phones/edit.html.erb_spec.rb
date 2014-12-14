require 'rails_helper'

RSpec.describe "buy_phones/edit", :type => :view do
  before(:each) do
    @buy_phone = assign(:buy_phone, BuyPhone.create!())
  end

  it "renders the edit buy_phone form" do
    render

    assert_select "form[action=?][method=?]", buy_phone_path(@buy_phone), "post" do
    end
  end
end
