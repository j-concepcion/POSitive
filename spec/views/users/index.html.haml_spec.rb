require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, Kaminari.paginate_array(create_pair(:user)).page(1))
    assign(:q,User.search)
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "active".to_s, :count => 2
  end
end
