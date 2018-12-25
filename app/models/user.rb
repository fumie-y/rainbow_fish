class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true


  has_many :photos #dependent: :destroy(後で表示)
  has_many :likes #dependent: :destroy(後で表示)
end
