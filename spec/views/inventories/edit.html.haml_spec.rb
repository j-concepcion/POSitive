require 'rails_helper'

RSpec.describe "inventories/edit", :type => :view do
  before(:each) do
    @inventory = assign(:inventory, Inventory.create!(
      :item_name => "MyString",
      :quantity => 1,
      :inventory_type => "MyString"
    ))
  end

  it "renders the edit inventory form" do
    render

    assert_select "form[action=?][method=?]", inventory_path(@inventory), "post" do

      assert_select "input#inventory_item_name[name=?]", "inventory[item_name]"

      assert_select "input#inventory_quantity[name=?]", "inventory[quantity]"

      assert_select "input#inventory_inventory_type[name=?]", "inventory[inventory_type]"
    end
  end
end
