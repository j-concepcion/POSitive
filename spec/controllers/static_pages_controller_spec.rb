require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET 'inventory'" do
    it "returns http success" do
      get 'inventory'
      expect(response).to be_success
    end
  end

end
