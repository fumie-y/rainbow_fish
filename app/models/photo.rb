class Photo < ApplicationRecord
  validates :user_id, presence: true
end