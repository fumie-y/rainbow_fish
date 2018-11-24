class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  def photos
    return Photo.where(user_id: self.id)
  end
end
