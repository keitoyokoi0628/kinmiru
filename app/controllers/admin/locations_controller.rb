class Admin::LocationsController < ApplicationController
  def index
    @location = Location.new
    @locations = Location.all
  end
end
