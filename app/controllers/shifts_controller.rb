class ShiftsController < ApplicationController

  def index
    @shifts = Shift.all
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.admin_id = current_admin.id

    if @shift.save
      redirect_to shifts_path
    else
      render :new
    end
  end

  private
  def shift_params
    params.require(:shift).permit(:day_of_week, :start_time, :end_time, :position)
  end
end
