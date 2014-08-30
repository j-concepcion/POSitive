require 'rails_helper'

RSpec.describe "inventories/index", :type => :view do
  before(:each) do
    assign(:inventories, [
      Inventory.create!(
        :item_name => "Item Name",
        :quantity => 1,
        :inventory_type => "Inventory Type"
      ),
      Inventory.create!(
        :item_name => "Item Name",
        :quantity => 1,
        :inventory_type => "Inventory Type"
      )
    ])
  end

  it "renders a list of inventories" do
    render
    assert_select "tr>td", :text => "Item Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Inventory Type".to_s, :count => 2
  end
end
