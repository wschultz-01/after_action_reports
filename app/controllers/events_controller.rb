class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(title: 'title', description: 'description', date: '4/7/2021')

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end
  
  
end
