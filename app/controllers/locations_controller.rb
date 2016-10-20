class LocationsController < ApplicationController

  def new
    @current_location = Location.new location_params
    respond_to :json
  end

  private
  def location_params
    params.require(:location).permit :lat, :long
  end
end
