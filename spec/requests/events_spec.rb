require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    before :each do        
      @user = create(:user)
      @auth_token = login(@user)
    end

    it "works!" do
      get events_path, headers: {'Authorization' => @auth_token }
      expect(response).to have_http_status(200)
    end
  end
end
