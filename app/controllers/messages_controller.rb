class MessagesController < ApplicationController
  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message = Message.new(message_params)
    @message.chat_room = @chat_room
    @message.user = current_user
    @message.property =
    if @message.save!
      redirect_to chat_room_path(@chat_room, anchor: "message-#{@message.id}")
    else
      render "chat_rooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
