class ReportsController < ApplicationController
  
  skip_before_action :authorized, only: [:show]
  
  def index
  end
  
  def show
    @report = Report.find(params[:id])
  end
  
  def new
    @event = Event.find(params[:event_id])
    @report = Report.new
  end
  
  def create
    @report = Report.new(report_params)
    @report.event = Event.find(params[:event_id])
    @report.user = current_user
    
    if @report.save
      redirect_to @report
    else
      render :new
    end
  end
  
  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])

    if @report.update(report_params)
      redirect_to report_path(@report)
    else
      render :edit
    end
  end
  
  def destroy
    @report = Report.find(params[:id])
    @event = @report.event
    @report.destroy

    redirect_to event_path(@event)
  end
  
  def myreports
    @reports = current_user.reports
    render :myreports
  end
  
  private
    
    def report_params
      params.require(:report).permit(:expectations, :actual_events, :lessons, :next_time)
    end
  
end
