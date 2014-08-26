require 'rails_helper'

RSpec.describe "order_slip_items/new", :type => :view do
  before(:each) do
    assign(:order_slip_item, OrderSlipItem.new(
      :quantity => 1
    ))
  end

  it "renders new order_slip_item form" do
    render

    assert_select "form[action=?][method=?]", order_slip_items_path, "post" do

      assert_select "input#order_slip_item_quantity[name=?]", "order_slip_item[quantity]"
    end
  end
end
