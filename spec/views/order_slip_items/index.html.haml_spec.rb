require 'rails_helper'

RSpec.describe "order_slip_items/index", :type => :view do
  before(:each) do
    assign(:order_slip_items, [
      OrderSlipItem.create!(
        :quantity => 1
      ),
      OrderSlipItem.create!(
        :quantity => 1
      )
    ])
  end

  it "renders a list of order_slip_items" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
