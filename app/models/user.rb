class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  mount_uploader :profile_image, ProfileImageUploader

  has_many :photos #dependent: :destroy(後で表示)
  has_many :likes #dependent: :destroy(後で表示)
end
