class SlotsController < ApplicationControlle
  def index
    @slots = Slot.all
  end

  def indexProperty
    @slots = Slot.where(property_id: params[:property_id])
  end

  def show
    @slot = Slot.find(params[:id])
  end

  def new
    @slot = Slot.new
  end

  def create
    @slot = Slot.new(slot_params)

    if @slot.save
      redirect_to @slot
    else
      render 'new'
    end
  end

  def edit
    @slot = Slot.find(params[:id])
  end

  def update
    @slot = Slot.find(params[:id])

    if @slot.update(slot_params)
      redirect_to @slot
    else
      render 'edit'
    end
  end

  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy

    redirect_to slots_path
  end

  private
    def slot_params
      params.require(:slot).permit(:property_id, :date, :max_visitor)
    end
end
