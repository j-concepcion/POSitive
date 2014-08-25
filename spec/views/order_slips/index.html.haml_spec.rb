require 'rails_helper'

RSpec.describe "order_slips/index", :type => :view do
  before(:each) do
    assign(:order_slips, [
      OrderSlip.create!(
        :order_type => "Order Type",
        :table_number => 1,
        :takeout_number => 2,
        :quantity => 3
      ),
      OrderSlip.create!(
        :order_type => "Order Type",
        :table_number => 1,
        :takeout_number => 2,
        :quantity => 3
      )
    ])
  end

  it "renders a list of order_slips" do
    render
    assert_select "tr>td", :text => "Order Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
