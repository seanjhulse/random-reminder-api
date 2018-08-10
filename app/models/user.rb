class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_one :device
  validates :email, uniqueness: true
end
