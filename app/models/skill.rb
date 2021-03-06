class Skill < ApplicationRecord
  SKILLS = ["Python","Java","Ruby/Ruby on rails","HTML","Javascript","C","C++","C#","PHP","SQL","Swift","CSS","Visual Basic","Product Management","R","R++"]
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one :photo, through: :users
  validates :name, presence: true
  validates :name, inclusion: { in: ["Python","Java","Ruby/Ruby on rails","HTML","Javascript","C","C++","C#","PHP","SQL","Swift","CSS","Visual Basic","Product Management","R","R++"],
    message: "%{value} is not in the list" }
  validates :price, presence: true, numericality: true

  def average_rating
    array = reviews.pluck(:rating)
    count = 0
    array.each {|number|count += number}
    return count
  end
end
