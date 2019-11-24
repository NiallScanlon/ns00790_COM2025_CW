class Booking < ApplicationRecord

  validates  :time, uniqueness: true

  belongs_to :barber
  belongs_to :user
end
