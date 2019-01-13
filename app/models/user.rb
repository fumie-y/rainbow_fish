class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: {maximum: 20}, on: :create
  validates :password, presence: true, length: {maximum: 20}, on: :create
  validates :profile_image, presence: true, on: :create
  
  mount_uploader :profile_image, NewPhotoImageUploader

  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
end

