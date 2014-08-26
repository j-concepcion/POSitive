require 'rails_helper'

RSpec.describe "order_slip_items/edit", :type => :view do
  before(:each) do
    @order_slip_item = assign(:order_slip_item, OrderSlipItem.create!(
      :quantity => 1
    ))
  end

  it "renders the edit order_slip_item form" do
    render

    assert_select "form[action=?][method=?]", order_slip_item_path(@order_slip_item), "post" do

      assert_select "input#order_slip_item_quantity[name=?]", "order_slip_item[quantity]"
    end
  end
end
