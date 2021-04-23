class EventsController < ApplicationController
  
  skip_before_action :authorized, only: [:index, :show]
  
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
    @reports = @event.reports.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path
  end
  
  def myevents
    @events = current_user.events
    render :myevents
  end
  
  
    private
    def event_params
      params.require(:event).permit(:title, :description, :date)
    end
  
  
  
  
end
