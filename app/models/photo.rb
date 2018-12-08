class Photo < ApplicationRecord
  validates :user_id, presence: true
  #mount_uploader :image, ImageUploader

  has_many :tags
  has_many :likes
  belongs_to :user
end