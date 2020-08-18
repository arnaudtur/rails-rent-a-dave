class User < ApplicationRecord
    has_many :skills
    has_many :bookings
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true
    validates :password, uniqueness: true
end
