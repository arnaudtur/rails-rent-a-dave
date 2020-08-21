class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :skills
  has_many :bookings
  has_one_attached :photo
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, uniqueness: true
end
