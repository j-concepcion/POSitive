require 'rails_helper'

RSpec.describe "products/edit", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :item_name => "MyString",
      :category => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_item_name[name=?]", "product[item_name]"

      assert_select "input#product_category[name=?]", "product[category]"

      assert_select "input#product_price[name=?]", "product[price]"
    end
  end
end
