class RoomsController < ApplicationController
  def index
    @user = User.all
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ルーム情報を新規登録しました"
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

  def search
  end

  def show
    @room = Room.find(params[:id])
  end

  private
  
  def room_params
    params.require(:room).permit(:user_id, :room_image, :room_name, :description, :fee, :address)
  end

end
