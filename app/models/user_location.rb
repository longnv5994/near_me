class UserLocation < ApplicationRecord
  belongs_to :location
  belongs_to :user

  class << self
    def search_users location_id
      users_id = self.where(location_id: location_id).distinct.pluck :user_id
      User.where id: users_id
    end
  end
end
