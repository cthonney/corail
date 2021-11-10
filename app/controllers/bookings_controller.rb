class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user.id)

  end

  def indexProperty
    @bookings = Booking.where(property_id: params[:id])
  end

  def show
    @booking = Booking.find(params[:id])
  end



  def create
    @booking = Booking.new
    @booking.user_id = current_user.id
    @booking.slot_id = params[:slot_id]
    raise
    if @booking.save
      flash[:notice] = "Booking was successfully created"
      redirect_to bookings_path
    else
      render :new
    end

  end

  def edit
    @booking = Booking.find(params[:id])


  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      flash[:notice] = "Booking was successfully updated"
      redirect_to bookings_path
    else
      render :edit
    end

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Booking was successfully deleted"
    redirect_to bookings_path

  end

  private


end