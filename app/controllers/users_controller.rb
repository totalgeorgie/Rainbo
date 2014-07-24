class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def show
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:given_name, :surname, :email, :password)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end