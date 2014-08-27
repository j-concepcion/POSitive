require 'rails_helper'

RSpec.describe "inventories/show", :type => :view do
  before(:each) do
    @inventory = assign(:inventory, Inventory.create!(
      :item_name => "Item Name",
      :quantity => 1,
      :buying_price => "9.99",
      :selling_price => "9.99",
      :waste_age => "Waste Age"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Waste Age/)
  end
end
