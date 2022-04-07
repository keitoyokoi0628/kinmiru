class Admin::LocationsController < ApplicationController
  def index
    @location = Location.new
    @locations = Location.all
  end

  def create
    @location = Location.new(location_params)
    @location.save!
    redirect_to admin_locations_path
  end

  private

  def location_params
    params.require(:location).permit(:location)
  end


end
