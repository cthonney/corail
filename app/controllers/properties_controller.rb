class PropertiesController < ApplicationController

  def index
    @properties = policy_scope(Property)
    @properties = Property.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude
      }
    end
  end

  def show
    @property = Property.find(params[:id])
    @message = Message.find_by(user_id: current_user.id, property_id: @property.id)
    @slots = Slot.where(property_id: params[:id])
    @chat_rooms = current_user.chat_rooms.uniq
    @slot = Slot.new(property: @property)
    @booking = Booking.new(slot_id:params[:slot_id], user_id:current_user.id)
    authorize @property
  end

  def new
    @property = Property.new
    authorize @property
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    @property.save
    authorize @property

    redirect_to property_path(@property)
  end

  def edit
    @property = Property.find(params[:id])
    authorize @property
  end

  def update
    @property = Property.find(params[:id])
    authorize @property
    @property.update(property_params)
    redirect_to property_path(@property)
  end

  def destroy
    @property = Property.find(params[:id])
    authorize @property
    @property.destroy
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(:property_type, :price, :living_space, :land_surface, :location, :latitude, :longitude, :parking_space, :pool, :room, :bathroom, :sea_view)
  end
end
