class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :password, presence: true, length: {maximum: 50}, allow_nil: true
   validates :password, presence: true, allow_nil: true
  mount_uploader :profile_image, NewPhotoImageUploader

  has_many :photos #dependent: :destroy(後で表示)
  has_many :likes #dependent: :destroy(後で表示)
end
