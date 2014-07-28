class StaticController < ApplicationController
  before_action :require_logged_in!, only: :root
  
  def root
  end
  
  def splash
  end
  
  def help
  end
end