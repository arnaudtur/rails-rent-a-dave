class Skill < ApplicationRecord
  SKILLS = ["Python","Java","Ruby/Ruby on rails","HTML","Javascript","C","C++","C#","PHP","SQL","Swift","CSS","Visual Basic","Product Management","R","R++"]
  belongs_to :user
  validates :name, presence: true, 
  validates :name, inclusion: { in: SKILLS,
    message: "Skill not in the skill list" }
  validates :price, presence: true, numericality: true
end
