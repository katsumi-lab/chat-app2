class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id]) #/rooms:room_id/messages
    @messages = @room.messages.includes(:user) #チャットルームのメッセージを代入。メッセージ情報に紐付くユーザー情報を纏めて取得
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params #message_paramsの定義。ログインユーザーと紐付いているメッセージ内容を受け取る
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

end
