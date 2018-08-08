require 'rails_helper'

RSpec.describe Device, type: :model do
  context "is created" do
    
    it "has an associated user" do
      user = create(:user)
      device = create(:device, user_id: user.id)
      expect(device.user_id).to eq(user.id)
    end

    it "validates presence" do
      user = create(:user)     
      device = create(:device, user_id: user.id)
      expect(device.valid?).to eq(true)
    end

  end
end
