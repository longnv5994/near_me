class User < ApplicationRecord
  has_many :user_locations
  has_many :relationships
  has_many :friends, through: :relationships
end
