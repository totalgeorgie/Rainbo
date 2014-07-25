class StaticController < ApplicationController
  before_action :require_logged_in!, only: [:dashboard]
  
  def splash
  end
  
  def dashboard
  end
end