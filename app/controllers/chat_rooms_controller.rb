class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.where(user_id: current_user)
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @property = Property.find(params[:property_id])
    authorize @chat_room
    @message = Message.new
    @chat_rooms = current_user.chat_rooms.uniq
  end

  def create
    @property = Property.find(params[:property_id])
    @chat_room = ChatRoom.create!(title: currrent_user.surname + " " + current_user.name + " to " + @property.property_type + " at " + @property.address)
    authorize @chat_room
    redirect_to property_chat_room_path(@property, @chat_room)
  end
end
