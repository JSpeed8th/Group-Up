class InvitesController < ApplicationController

	def index
		@invites = Invite.all
		event = Event.all
		user = User.all
		location = Location.all
	end


	def assign
		eventId = params[:evid].to_i
		userId = params[:userid].to_i
		locationId = params[:loc].to_i
		host = false
		#if the parameter in the URI is set to true we know they are a host and have been sent here from the location controller
		if params[:host] == "true"
			host = true

			newInvite = Invite.new(event_id: eventId, user_id: userId, location_id: locationId, status: "waiting", host: host)
			if newInvite.save
				redirect_to "/events/#{eventId}"
			else
				redirect_to "/events/20"
			end

		else #when guest invite is being populated
			newInvite = Invite.new(event_id: eventId, user_id: userId, location_id: locationId, status: "pending", host: host)
			if newInvite.save
				redirect_to "/invites/#{eventId}"
			else
				redirect_to "/events/10"
			end
		end

	end

	def show
		@thisInvite = Invite.find(params[:id])
		#if button accept is pushed the user has accepted going to the event. Javascript will be used to insure that adress feild has been properly filled out.
			#run inviteAccepted method to further process information.
		#if button for decline is pushed, the user has declined going to the event
			#run  method
	end

end
