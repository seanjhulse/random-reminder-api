class Event < ApplicationRecord
  belongs_to :user

  has_many :jobs

  validates :name, presence: true
  validates :count, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true

end
