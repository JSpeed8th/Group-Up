class LocationsController < ApplicationController


  def index
    @locations = Location.all
  end


	def assign
		puts "inside the location LocationsController assign method"
		latitude = params[:lat].to_f
		longitude = params[:long].to_f
		extraParams = params[:name] #see "paramsArray" variable assignment for more detail on extraParams variable

		#the :isinvite parameter, aka: params[:isinvite], indicates if this is a location that will need to be directed to the invites controller (true) or the recommendations controller (false)
		if params[:isinvite] == "true"
			#split params up into an array: [0] is the event id, [1] is the user id, [2] is whether or not they're a host
			paramsArray = extraParams.split("_")
			#create a new location record
			newLocation = Location.new(lat: latitude, long: longitude, name: extraParams)
			if newLocation.save #save new location record
				redirect_to "/invites/assign/#{paramsArray[0]}/#{paramsArray[1]}/#{paramsArray[2]}/#{newLocation.id}"
			else
				redirect_to "/events/20"
			end
		else
			#do some stuff for if it is a recommendation location creation
		end

	end



  private

  
  def locations_params
    params.require(:locations).permit(:lat, :long, :name)
  end

end
