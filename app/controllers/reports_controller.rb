class ReportsController < ApplicationController
  
  def index
  end
  
  def show
    @report = Event.find(params[:event_id]).reports.find(params[:id])
  end
  
  def new
    @event = Event.find(params[:event_id])
    @report = Report.new
  end
  
  def create
    @event = Event.find(params[:event_id])
    @report = @event.reports.create(report_params)
    redirect_to event_path(@event)
  end
  
  def edit
    @report = Event.find(params[:event_id]).reports.find(params[:id])
  end

  def update
    @report = Event.find(params[:event_id]).reports.find(params[:id])

    if @report.update(report_params)
      redirect_to @report
    else
      render :edit
    end
  end
  
  def destroy
  end
  
  private
    
    def report_params
      params.require(:report).permit(:expectations, :actual_events, :lessons, :next_time)
    end
  
end
