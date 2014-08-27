require 'rails_helper'

RSpec.describe "inventories/edit", :type => :view do
  before(:each) do
    @inventory = assign(:inventory, Inventory.create!(
      :item_name => "MyString",
      :quantity => 1,
      :buying_price => "9.99",
      :selling_price => "9.99",
      :waste_age => "MyString"
    ))
  end

  it "renders the edit inventory form" do
    render

    assert_select "form[action=?][method=?]", inventory_path(@inventory), "post" do

      assert_select "input#inventory_item_name[name=?]", "inventory[item_name]"

      assert_select "input#inventory_quantity[name=?]", "inventory[quantity]"

      assert_select "input#inventory_buying_price[name=?]", "inventory[buying_price]"

      assert_select "input#inventory_selling_price[name=?]", "inventory[selling_price]"

      assert_select "input#inventory_waste_age[name=?]", "inventory[waste_age]"
    end
  end
end
