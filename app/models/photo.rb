class Photo < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :title, presence: true

  mount_uploader :image, NewPhotoImageUploader

  has_many :tags
  accepts_nested_attributes_for :tags

  has_many :likes, dependent: :destroy
  belongs_to :user
end
