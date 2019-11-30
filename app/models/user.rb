class User < ApplicationRecord
  include Clearance::User

  validates  :email, uniqueness: true, presence: true


end
