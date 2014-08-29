require 'rails_helper'

RSpec.describe "market_food_inventories/new", :type => :view do
  before(:each) do
    assign(:market_food_inventory, MarketFoodInventory.new(
      :item_name => "MyString",
      :quantity => 1
    ))
  end

  it "renders new market_food_inventory form" do
    render

    assert_select "form[action=?][method=?]", market_food_inventories_path, "post" do

      assert_select "input#market_food_inventory_item_name[name=?]", "market_food_inventory[item_name]"

      assert_select "input#market_food_inventory_quantity[name=?]", "market_food_inventory[quantity]"
    end
  end
end
