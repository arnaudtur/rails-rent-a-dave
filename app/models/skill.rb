class Skill < ApplicationRecord
  SKILLS = ["Python","Java","Ruby/Ruby on rails","HTML","Javascript","C","C++","C#","PHP","SQL","Swift","CSS","Visual Basic","Product Management","R","R++"]
  belongs_to :user
  validates :name, presence: true 
  validates :name, inclusion: { in: ["Python","Java","Ruby/Ruby on rails","HTML","Javascript","C","C++","C#","PHP","SQL","Swift","CSS","Visual Basic","Product Management","R","R++"],
    message: "%{value} is not a valid size" }
  validates :price, presence: true, numericality: true
end
