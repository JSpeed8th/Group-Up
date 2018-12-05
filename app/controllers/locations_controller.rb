class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  private
def locations_params
	params.require(:locations).permit(:lat, :long, :name)
end
end
