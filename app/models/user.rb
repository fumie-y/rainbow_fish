class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :photos
  has_many :likes
end
