class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  validates :user, presence: true
  validates :price, presence: true, numericality: true
  validates :start_date, presence: true
  validates_date :start_date
  validates :end_date, presence: true
  validates_date :end_date
  validates :status, presence: true
  validates :end_date_after_start_date
  private 
    def end_date_after_start_date
      return if end_date.blank || start_date.blank
      if end_date < start_date
        errors.add(:end_date, "must be after start date")
      end
    end

end
