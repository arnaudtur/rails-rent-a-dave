class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, presence: true
  validates :rating, numericality: true
  validates :content, presence: true
end
