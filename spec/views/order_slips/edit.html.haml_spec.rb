require 'rails_helper'

RSpec.describe "order_slips/edit", :type => :view do
  before(:each) do
    @order_slip = assign(:order_slip, OrderSlip.create!(
      :order_type => "MyString",
      :table_number => 1,
      :takeout_number => 1,
      :quantity => 1
    ))
  end

  it "renders the edit order_slip form" do
    render

    assert_select "form[action=?][method=?]", order_slip_path(@order_slip), "post" do

      assert_select "input#order_slip_order_type[name=?]", "order_slip[order_type]"

      assert_select "input#order_slip_table_number[name=?]", "order_slip[table_number]"

      assert_select "input#order_slip_takeout_number[name=?]", "order_slip[takeout_number]"

      assert_select "input#order_slip_quantity[name=?]", "order_slip[quantity]"
    end
  end
end
