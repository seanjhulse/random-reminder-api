require 'rails_helper'

RSpec.describe Event, type: :model do
  it "has an associated user" do
      user = create(:user)
      event = create(:event, user_id: user.id)
      expect(event.user_id).to eq(user.id)
    end

    it "validates presence" do
      user = create(:user)     
      event = create(:event, user_id: user.id)
      expect(event.valid?).to eq(true)
    end
end
