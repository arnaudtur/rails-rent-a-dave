class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  validates :user, presence: true
end
