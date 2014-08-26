require 'rails_helper'

RSpec.describe "order_slip_items/show", :type => :view do
  before(:each) do
    @order_slip_item = assign(:order_slip_item, OrderSlipItem.create!(
      :quantity => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end
