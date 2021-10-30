class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.find(params[:id])
    @message = Message.new
  end
end
