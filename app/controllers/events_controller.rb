
class EventsController < ApplicationController

  def new
  # @event = Event.find(params[:id])
  @users = User.all
  end

  def show
    @thisEvent = Event.find(params[:id])
  end

  def assign
    location = 23
    longitude = 23
    paramName = ""

    newEvent = Event.new(event_params)

    if newEvent.save
      paramName = newEvent.id.to_s+"_"+current_user.id.to_s+"_true"
      redirect_to "/locations/assign/true/#{latitude}/#{longitude}/#{paramName}"
    else
      render "/events/new"
    end

  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :event_type, :start, :finish, :response)

  end
end
