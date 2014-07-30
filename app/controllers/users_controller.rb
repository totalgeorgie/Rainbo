class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render json: @user.errors.full_messages
    end
  end
  
  def update
    if @user.update_attributes(user_params)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render json: @user.errors.full_messages
    end
  end
  
  def destroy
    @user.destroy
    flash.now[:errors] =
      ['Thanks for using ProFlows. Your account has been deleted.']
    redirect_to '/'
  end
  
  def activate
    
  end
  
  private
  def user_params
    params.require(:user).permit(:given_name, :surname, :email, :password)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end