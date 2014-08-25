require 'rails_helper'

RSpec.describe "OrderSlips", :type => :request do
  describe "GET /order_slips" do
    it "works! (now write some real specs)" do
      get order_slips_path
      expect(response.status).to be(200)
    end
  end
end
