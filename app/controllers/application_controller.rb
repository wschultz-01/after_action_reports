class ApplicationController < ActionController::Base
  
  before_action :authorized
  
  def current_user
    User.find_by(id: session[:user_id])
  end
  helper_method :current_user
  
  def logged_in?
    !current_user.nil?
  end
  helper_method :logged_in?
  
  def authorized
   redirect_to '/' unless logged_in?
  end
  
end
