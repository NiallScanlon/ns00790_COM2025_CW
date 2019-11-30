class Booking < ApplicationRecord

  validates  :time, uniqueness: true, presence: true
  validates :date, presence: true
  validates :barber_id, presence: true
  validates :user_id, presence: true




  belongs_to :barber
  belongs_to :user
end
