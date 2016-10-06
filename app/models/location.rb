class Location < ApplicationRecord
  has_many :user_locations
  accepts_nested_attributes_for :user_locations
end
