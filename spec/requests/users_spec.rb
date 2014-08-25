require 'rails_helper'

RSpec.describe "Users", :type => :request do
  before do
    # Sign in as a user.
    sign_in_as_a_valid_user(create(:admin_user))
  end
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_path
      expect(response.status).to be(200)
    end
  end
end
