class LocationsController < ApplicationController

  def new
    @current_location = Location.new location_params
    session[:location] = params[:location]
    respond_to :json
  end

  def show
    params[:location] = session[:location]
    @current_location = Location.new location_params
    @locations = Location
      .includes(:user_locations)
      .near([@current_location.lat, @current_location.long], 500, units: :km)
  end

  private
  def location_params
    params.require(:location).permit :lat, :long
  end
end
