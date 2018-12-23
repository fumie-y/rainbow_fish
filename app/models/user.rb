class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  validates :user_id, {presence: true}

  has_many :photos #dependent: :destroy(後で表示)
  has_many :likes #dependent: :destroy(後で表示)
end
