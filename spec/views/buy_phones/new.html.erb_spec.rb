require 'rails_helper'

RSpec.describe "buy_phones/new", :type => :view do
  before(:each) do
    assign(:buy_phone, BuyPhone.new())
  end

  it "renders new buy_phone form" do
    render

    assert_select "form[action=?][method=?]", buy_phones_path, "post" do
    end
  end
end
