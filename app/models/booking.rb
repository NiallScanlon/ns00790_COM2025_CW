class Booking < ApplicationRecord


  belongs_to :barber
  belongs_to :user
end
