class FriendsController < ApplicationController

  def show
    @current_location = Location.new location_params
    respond_to :json
    byebug
    @locations = Location.near [@current_location.lat, @current_location.long],
      Settings.default_distance, units: Settings.unit_distance, order: ""
    @friends = UserLocation.search_users @locations.ids
    byebug
  end

  private
  def location_params
    params.require(:location).permit :lat, :long
  end
end
