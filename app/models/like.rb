class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :photo_id, presence: true
end
