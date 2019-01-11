class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  # validates :password, presence: true, length: {maximum: 50}, allow_nil: true
  validates :password, presence: true, on: :create, length: {maximum: 50}
  
  mount_uploader :profile_image, NewPhotoImageUploader

  has_many :photos, :dependent => :destroy
  has_many :likes, :dependent => :destroy
end

