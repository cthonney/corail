class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
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


  def dashboard
    @user = current_user

    @properties = @user.properties

    @chat_rooms = @user.chat_rooms.uniq

    @slots = @user.slots

    @bookings = @user.bookings

    # @bookings = @slot.bookings

  end
end
