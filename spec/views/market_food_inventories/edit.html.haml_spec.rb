require 'rails_helper'

RSpec.describe "market_food_inventories/edit", :type => :view do
  before(:each) do
    @market_food_inventory = assign(:market_food_inventory, MarketFoodInventory.create!(
      :item_name => "MyString",
      :quantity => 1
    ))
  end

  it "renders the edit market_food_inventory form" do
    render

    assert_select "form[action=?][method=?]", market_food_inventory_path(@market_food_inventory), "post" do

      assert_select "input#market_food_inventory_item_name[name=?]", "market_food_inventory[item_name]"

      assert_select "input#market_food_inventory_quantity[name=?]", "market_food_inventory[quantity]"
    end
  end
end
