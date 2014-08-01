module Api
  class BoardsController < ApiController
    def create
      @board = current_user.boards.new(board_params)
      
      if @board.save
        render json: @board
      else
        render json: @board.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @board = nil;
      
      current_user.all_boards.each do |board|
        @board = board if board.id.to_s == params[:id]
      end
      
      @board.try(:destroy)
      render json: {}
    end
    
    def update
      @board = Board.find(params[:id])
      
      if @board.update_attributes(board_params)
        render json: @board
      else
        render json: @board.errors.full_messages, status: :unprocessable_entity
      end
    end

    def index
      @boards = current_user.all_boards
      render json: @boards
    end

    def show
      @board = Board.includes(:members, lists: :cards).find(params[:id])

      if @board.is_member?(current_user)
        render :show
      else
        render json: ["You aren't a member of this board"], status: 403
      end
    end
    
    def subscribe
      @user = User.find_by_email(params[:user_email])
      @board = Board.find(params[:board_id])
      
      if(@user && @board && !@board.members.include?(@user))
        @board.add_member(@user)
        render json: ["Successfully added member"], status: 200
      else
        render json: ["Unable to add member."], status: 403
      end
    end

    private

    def board_params
      params.require(:board).permit(:title)
    end
  end
end