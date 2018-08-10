class Device < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :token, :scope => :user_id
  validates_uniqueness_of :user_id, { message: "already has a device" }
end
