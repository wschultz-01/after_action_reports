class ReportsController < ApplicationController
  
  def index
  end
  
  def show
  end
  
  def new
  end
  
  def create
    @article = Article.find(params[:article_id])
    @report = @article.reports.create(report_params)
    redirect_to report_path(@report)
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
