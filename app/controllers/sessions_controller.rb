class SessionsController < ApplicationController
  
  skip_before_action :authorized, only: [:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = 'Incorrect Login Details'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to :root
  end
end
