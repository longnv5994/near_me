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
    locations = []
    new_graph
    @data = @graph.get_connections("me", "friends", fields: [type.to_s+"{place}"], limit: 5000)
    @data.each do |data|
      if data[type]
        craw_friends data["id"]
        create_relationship id, data["id"]
        @graph_data = @graph.get_connections(data["id"], type, fields: ["place"], limit: 5000)
        @graph_data.each do |graph_data|
          if graph_data["place"]
            if graph_data["place"]["location"]
              @location = Location.find_or_create_by(city:  graph_data["place"]["location"]["city"],
                country: graph_data["place"]["location"]["country"],
                place_name: graph_data["place"]["name"],
                lat: graph_data["place"]["location"]["latitude"],
                long: graph_data["place"]["location"]["longitude"],
                street: graph_data["place"]["location"]["street"],
                zip: graph_data["place"]["location"]["zip"])
              @location.update_attributes(user_locations_attributes:
                [user_id: find_friend(data["id"]).id])
              locations << @location
            end
          end
        end
      end
    end
    Location.import locations, recursive: true, batch_size: 500
    User.import @users
    Relationship.import @relationships
  end

  def craw_friends friend_uid
    @users = []
    user_new = User.find_or_create_by uid: friend_uid
    @users << user_new
  end

  def create_relationship user_id, friend_uid
    @relationships = []
    find_friend friend_uid
    relationship = Relationship.find_or_create_by(user_id: user_id, friend_id: @friend.id )
    @relationships << relationship
  end

  def new_graph
    oauth_token = Settings.oauth_token
    @graph = Koala::Facebook::API.new oauth_token
  end

  def find_friend friend_uid
    @friend = User.find_by_uid friend_uid
  end
end
