class User < ApplicationRecord
  has_many :qr_codes
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, length: { in: 8..2000 }
  validates :name, presence: true
  
end