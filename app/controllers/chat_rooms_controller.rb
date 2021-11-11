class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.where(user_id: current_user)
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @property = Property.find(params[:property_id])
    @message = Message.new
    @chat_rooms = current_user.chat_rooms.uniq
  end

  def create
    @chat_room = ChatRoom.create!(title: current_user.name)
    @property = Property.find(params[:property_id])
    redirect_to property_chat_room_path(@property, @chat_room)
  end
end
