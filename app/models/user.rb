class User < ApplicationRecord
  validates :name, presence: true
  validates :password, presence: true, uniqueness: true
end
