require 'rails_helper'

RSpec.describe "inventories/show", :type => :view do
  before(:each) do
    @inventory = assign(:inventory, Inventory.create!(
      :item_name => "Item Name",
      :quantity => 1,
      :inventory_type => "Inventory Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Inventory Type/)
  end
end
