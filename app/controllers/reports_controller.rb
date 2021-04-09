class ReportsController < ApplicationController
  
  def index
  end
  
  def show
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
  
end
