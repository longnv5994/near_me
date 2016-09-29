class UserLocation < ApplicationRecord
  belongs_to :location, :user
end
