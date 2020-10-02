class RoomsController < ApplicationController
  
  def index
    
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy #destroyは削除のみなのでビューへ引き渡しがない為インスタンス変数の必要なし
    room = Room.find(params[:id]) #Room.find(params[:id])で削除したいチャットルームを特定
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
  end
end
