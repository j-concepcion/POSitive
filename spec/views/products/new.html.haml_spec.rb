require 'rails_helper'

RSpec.describe "products/new", :type => :view do
  before(:each) do
    assign(:product, Product.new(
      :item_name => "MyString",
      :category => "MyString",
      :price => "9.99"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_item_name[name=?]", "product[item_name]"

      assert_select "input#product_category[name=?]", "product[category]"

      assert_select "input#product_price[name=?]", "product[price]"
    end
  end
end
