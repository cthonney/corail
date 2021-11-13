class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end


  def dashboard
    @user = current_user

    @properties = @user.properties

    @chat_rooms = @user.chat_rooms

    @slots = @user.slots

    @bookings = @user.bookings

    # @bookings = @slot.bookings

  end
end
