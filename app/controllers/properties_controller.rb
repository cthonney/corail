class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    @property.save


    redirect_to property_path(@property)
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    redirect_to property_path(@property)
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end


  def create_chat
    @chat_room = ChatRoom.new
    @property = Property.find(params[:id])
    @chat_room.property = @property
    redirect_to chatroomshow
  end

  private

  def property_params
    params.require(:property).permit(:property_type, :price, :living_space, :land_surface, :location, :latitude, :longitude, :parking_space, :pool, :room, :bathroom, :sea_view)
  end
end
