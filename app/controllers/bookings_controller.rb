class BookingsController < ApplicationController
  def index
    @slot = Slot.find(params[:slot_id])
    @bookings = policy_scope(@slot.bookings)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @slot = Slot.find(params[:slot_id])
    @booking = Booking.new
    @booking.user_id = current_user.id
    @booking.slot_id = params[:slot_id]
    authorize @booking
    if @booking.save
      flash[:notice] = "Booking was successfully created"
      redirect_back(fallback_location: "something")
    else
      flash[:notice] = "Booking error!"
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
    authorize @booking
    @booking.destroy
    flash[:notice] = "Booking was successfully deleted"
    redirect_to bookings_path
  end

  private
end
