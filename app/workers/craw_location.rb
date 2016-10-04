class CrawLocation
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform id
    type = ["posts", "photos", "tagged_places"]
    type.each do |t|
      craw_location t, id
    end
  end

  private
  def craw_location type, id
    new_graph
    @graph_data = @graph.get_connections("me", "friends", fields: [type.to_s+"{place}"], limit: 1000)
    @graph_data.each do |data|
      if data[type]
        craw_friends data["id"]
        create_relationship id, data["id"]
        data[type]["data"].each do |data_location|
          if data_location["place"]
            if data_location["place"]["location"]
              @location = Location.find_or_create_by(city:  data_location["place"]["location"]["city"],
                country:  data_location["place"]["location"]["country"],
                place_name: data_location["place"]["name"],
                lat: data_location["place"]["location"]["latitude"],
                long: data_location["place"]["location"]["longitude"],
                street: data_location["place"]["location"]["street"],
                zip: data_location["place"]["location"]["zip"])
                @location.save
                @location.update_attributes(user_locations_attributes:
                  [user_id: find_friend(data["id"]).id])
            end
          end
        end
      end
    end
  end

  def craw_friends friend_uid
    @user_new = User.find_or_create_by uid: friend_uid
    @user_new.save
  end

  def create_relationship user_id, friend_uid
    find_friend friend_uid
    @relationship = Relationship.find_or_create_by(user_id: user_id, friend_id: @friend.id )
    @relationship.save
  end

  def new_graph
    oauth_token = Settings.oauth_token
    @graph = Koala::Facebook::API.new oauth_token
  end

  def find_friend friend_uid
    @friend = User.find_by_uid friend_uid
  end
end
