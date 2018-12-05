class EventsController < ApplicationController

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

  def new
  # @event = Event.find(params[:id])
  @users = User.all
  end

  def assign
    a = Event.new(event_params)
    a.id = params[:id]
    if a.save
      puts "yay"
      puts "yay"
      puts "yay"
      puts "yay"
      redirect_to "/events/#{a.id}"
    else
      render "/events/new"
    end

  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :event_type, :start, :finish, :response)

  end
end
