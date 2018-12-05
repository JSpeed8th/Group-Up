class EventsController < ApplicationController
<<<<<<< HEAD

def show
  @events = Event.find(params[:id])
end

  def create
    @users = User.all
    event = Event.new(event_params)
    if event.save
      redirect_to "/users/6"
    else
      redirect_to "/events/new"
    end
  end

=======
 
>>>>>>> dd59c859d9847a07b0c95cc87e897553754a6631
  def new
  # @event = Event.find(params[:id])
  @users = User.all
  end

  def show
    @thisEvent = Event.find(params[:id])
  end

  def assign
<<<<<<< HEAD
    a = Event.new(event_params)
    a.id = params[:id]
    if a.save
      puts "yay"
      puts "yay"
      puts "yay"
      puts "yay"
      redirect_to "/events/#{a.id}"
=======
    latitude = 23
    longitude = 23
    paramName = ""
    
    newEvent = Event.new(event_params)

    if newEvent.save
      paramName = newEvent.id.to_s+"_"+current_user.id.to_s+"_true"
      redirect_to "/locations/assign/true/#{latitude}/#{longitude}/#{paramName}"
>>>>>>> dd59c859d9847a07b0c95cc87e897553754a6631
    else
      render "/events/new"
    end

  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :event_type, :start, :finish, :response)

  end
end
