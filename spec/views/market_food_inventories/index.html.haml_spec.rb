require 'rails_helper'

RSpec.describe "market_food_inventories/index", :type => :view do
  before(:each) do
    assign(:market_food_inventories, [
      MarketFoodInventory.create!(
        :item_name => "Item Name",
        :quantity => 1
      ),
      MarketFoodInventory.create!(
        :item_name => "Item Name",
        :quantity => 1
      )
    ])
  end

  it "renders a list of market_food_inventories" do
    render
    assert_select "tr>td", :text => "Item Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
