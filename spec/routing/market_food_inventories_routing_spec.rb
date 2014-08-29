require "rails_helper"

RSpec.describe MarketFoodInventoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/market_food_inventories").to route_to("market_food_inventories#index")
    end

    it "routes to #new" do
      expect(:get => "/market_food_inventories/new").to route_to("market_food_inventories#new")
    end

    it "routes to #show" do
      expect(:get => "/market_food_inventories/1").to route_to("market_food_inventories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/market_food_inventories/1/edit").to route_to("market_food_inventories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/market_food_inventories").to route_to("market_food_inventories#create")
    end

    it "routes to #update" do
      expect(:put => "/market_food_inventories/1").to route_to("market_food_inventories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/market_food_inventories/1").to route_to("market_food_inventories#destroy", :id => "1")
    end

  end
end
