class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    
    if @user
      log_in!(@user)
      redirect_to root_url
    else
      render json: @user.errors.to_json
    end
  end
  
  def destroy
    log_out!
    redirect_to '/splash'
  end
end