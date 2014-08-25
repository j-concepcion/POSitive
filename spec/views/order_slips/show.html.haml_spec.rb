require 'rails_helper'

RSpec.describe "order_slips/show", :type => :view do
  before(:each) do
    @order_slip = assign(:order_slip, OrderSlip.create!(
      :order_type => "Order Type",
      :table_number => 1,
      :takeout_number => 2,
      :quantity => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Order Type/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
