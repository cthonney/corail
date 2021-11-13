class SlotsController < ApplicationController
  def index
    @slots = policy_scope(Slot)
  end

  def show
    @slot = Slot.find(params[:id])
    authorize @slot
  end

  def new
    @slot = Slot.new
    @slot.property = Property.find(params[:property_id])
    authorize @slot
  end

  def create
    @slot = Slot.new(slot_params)
    @slot.property = Property.find(params[:property_id])
    authorize @slot
    if @slot.save
      # redirect_to @property_slot_path
      redirect_to property_path(@slot.property_id)
    else
      render 'new'
    end
  end

  def edit
    @property = Property.find(params[:property_id])
    @slot = Slot.find(params[:id])
    authorize @slot
  end

  def update
    @slot = Slot.find(params[:id])
    authorize @slot
    if @slot.update(slot_params)
      redirect_to property_path(@slot.property_id)
    else
      render 'edit'
    end
  end

  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy
    redirect_to property_path(@slot.property_id)
    authorize @slot
  end

  private
    def slot_params
      params.require(:slot).permit(:property_id, :date, :max_visitor)
    end
end
