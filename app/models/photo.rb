class Photo < ApplicationRecord
  validates :user_id, presence: true

  mount_uploader :image, NewPhotoImageUploader

  has_many :tags
  accepts_nested_attributes_for :tags

  has_many :likes
  belongs_to :user
end