class User < ApplicationRecord
  include Clearance::User

  validates  :email, uniqueness: true, presence: true

  has_one :booking
  has_one :barber, through: :booking

end
