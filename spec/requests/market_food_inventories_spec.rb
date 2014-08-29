require 'rails_helper'

RSpec.describe "MarketFoodInventories", :type => :request do
  describe "GET /market_food_inventories" do
    it "works! (now write some real specs)" do
      get market_food_inventories_path
      expect(response.status).to be(200)
    end
  end
end
