class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
    
  def create
   @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
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