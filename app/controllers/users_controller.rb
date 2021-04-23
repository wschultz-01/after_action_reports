class UsersController < ApplicationController
  
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
    
  def create
   @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to :new_user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end