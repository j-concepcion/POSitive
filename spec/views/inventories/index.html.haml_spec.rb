require 'rails_helper'

RSpec.describe "inventories/index", :type => :view do
  before(:each) do
    assign(:inventories, [
      Inventory.create!(
        :item_name => "Item Name",
        :quantity => 1,
        :buying_price => "9.99",
        :selling_price => "9.99",
        :waste_age => "Waste Age"
      ),
      Inventory.create!(
        :item_name => "Item Name",
        :quantity => 1,
        :buying_price => "9.99",
        :selling_price => "9.99",
        :waste_age => "Waste Age"
      )
    ])
  end

  it "renders a list of inventories" do
    render
    assert_select "tr>td", :text => "Item Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Waste Age".to_s, :count => 2
  end
end
