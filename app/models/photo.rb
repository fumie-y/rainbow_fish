class Photo < ApplicationRecord
  validates :user_id, presence: true

  has_many :tags
  has_many :likes
  belongs_to :user
end