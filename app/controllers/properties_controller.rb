class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new # needed to instantiate the form_for
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    @property.save

    # no need for app/views/restaurants/create.html.erb

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

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to properties_path
  end



  private

  def property_params
    params.require(:property).permit(:type, :price, :living_space, :land_surface, :location, :latitude, :longitude, :parking_space, :pool, :room, :bathroom, :sea_view)
  end
end
