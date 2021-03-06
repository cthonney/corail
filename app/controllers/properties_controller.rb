class PropertiesController < ApplicationController
  def index
    if params[:type].present? == false && params[:city].present? == false
      @properties = policy_scope(Property)
    elsif !params[:type] && params[:city].present?
      @properties = policy_scope(Property).where(address: params[:city])
    elsif params[:type] == "All" && params[:city].empty?
      @properties = policy_scope(Property)
    elsif params[:type] == "All" && params[:city].present?
      @properties = policy_scope(Property).where(address: params[:city])
    elsif params[:type] != "All" && params[:city].empty?
      @properties = policy_scope(Property).where(property_type: params[:type])
    elsif params[:type].present? || params[:city].present?
      @properties = policy_scope(Property).where(property_type: params[:type], address: params[:city])
    end
  end

  def show
    @property = Property.find(params[:id])
    @message = Message.find_by(user_id: current_user.id, property_id: @property.id)
    @slots = Slot.where(property_id: params[:id])
    @chat_rooms = current_user.chat_rooms.uniq
    @slot = Slot.new(property: @property)
    @booking = Booking.new(slot_id: params[:slot_id], user_id: current_user.id)
    authorize @property
    @markers = [{
      lat: @property.latitude,
      lng: @property.longitude,
      info_window: render_to_string(locals: { property: @property }),
    }]
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
    #Add photos to the params
    params.require(:property).permit(:property_type, :description, :bedrooms, :price, :living_space, :land_surface, :address, :latitude, :longitude, :parking_space, :pool, :room, :bathroom, :sea_view, photos: [])
  end
end
