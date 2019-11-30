class Barber < ApplicationRecord

  validates  :name,  presence: true
  validates :phone, presence: true
  validates :email, presence: true


  has_many :bookings
  has_many :users, through: :bookings
end
