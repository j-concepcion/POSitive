require 'rails_helper'

RSpec.describe "OrderSlipItems", :type => :request do
  describe "GET /order_slip_items" do
    it "works! (now write some real specs)" do
      get order_slip_items_path
      expect(response.status).to be(200)
    end
  end
end
