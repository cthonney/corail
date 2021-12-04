class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @properties = policy_scope(Property)
    @properties = Property.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        info_window: render_to_string(partial: "info_window", locals: { property: property }),
      }
    end
  end

  def dashboard
    @user = current_user
    @properties = @user.properties
    @chat_rooms_properties = []
    @properties.each do |property|
      @chat_rooms_properties << property.chat_rooms.uniq
    end
    @chat_rooms_messages = @user.chat_rooms.uniq
    @slots = @user.slots
    @bookings = @user.bookings
  end
end
