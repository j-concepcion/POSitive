require "rails_helper"

RSpec.describe OrderSlipsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/order_slips").to route_to("order_slips#index")
    end

    it "routes to #new" do
      expect(:get => "/order_slips/new").to route_to("order_slips#new")
    end

    it "routes to #show" do
      expect(:get => "/order_slips/1").to route_to("order_slips#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/order_slips/1/edit").to route_to("order_slips#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/order_slips").to route_to("order_slips#create")
    end

    it "routes to #update" do
      expect(:put => "/order_slips/1").to route_to("order_slips#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/order_slips/1").to route_to("order_slips#destroy", :id => "1")
    end

  end
end
