require 'rails_helper'

RSpec.describe "Devices", type: :request do
  describe "GET /devices" do
    before :each do        
      @user = create(:user)
      @auth_token = login(@user)
    end

    it "works! (now write some real specs)" do

      get devices_path, headers: {'Authorization' => @auth_token }
      expect(response).to have_http_status(200)
    end
  end
end
