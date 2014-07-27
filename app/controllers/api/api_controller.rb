module Api
  class ApiController < ApplicationController
    before_action :require_logged_in!

    def require_board_member!
      redirect_to '/splash' unless current_board.is_member?(current_user)
    end
  end
end