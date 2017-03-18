class ShiftsController < ApplicationController

  def index
    @shifts = Shift.all
  end

  def new
    @shift = Shift.new
  end

  def create
    params[:shift][:day_of_week].each do |day|
      @shift = Shift.new(shift_params)
      @shift.attributes = { day_of_week: day, admin_id: current_admin.id }

      return render :new unless @shift.save
    end
    redirect_to shifts_path
  end

  private
  def shift_params
    params.require(:shift).permit(:start_time, :end_time, :position,
                                  :day_of_week)
  end
end
