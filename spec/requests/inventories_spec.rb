require 'rails_helper'

RSpec.describe "Inventories", :type => :request do
  describe "GET /inventories" do
    it "works! (now write some real specs)" do
      get inventories_path
      expect(response.status).to be(200)
    end
  end
end
