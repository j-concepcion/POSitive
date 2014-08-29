require 'rails_helper'

RSpec.describe "market_food_inventories/show", :type => :view do
  before(:each) do
    @market_food_inventory = assign(:market_food_inventory, MarketFoodInventory.create!(
      :item_name => "Item Name",
      :quantity => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item Name/)
    expect(rendered).to match(/1/)
  end
end
