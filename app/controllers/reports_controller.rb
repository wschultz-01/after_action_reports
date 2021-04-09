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
    redirect_to report_path(@report)
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
    
    def report_params
      params.require(:report).permit(:expectations, :actual_events, :lessons, :next_time)
    end
  
end
