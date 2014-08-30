require 'rails_helper'

RSpec.describe "inventories/new", :type => :view do
  before(:each) do
    assign(:inventory, Inventory.new(
      :item_name => "MyString",
      :quantity => 1,
      :inventory_type => "MyString"
    ))
  end

  it "renders new inventory form" do
    render

    assert_select "form[action=?][method=?]", inventories_path, "post" do

      assert_select "input#inventory_item_name[name=?]", "inventory[item_name]"

      assert_select "input#inventory_quantity[name=?]", "inventory[quantity]"

      assert_select "input#inventory_inventory_type[name=?]", "inventory[inventory_type]"
    end
  end
end
