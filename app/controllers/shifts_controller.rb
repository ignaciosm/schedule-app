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
      @shift.attributes = { day_of_week: day,
                            admin_id: current_admin.id,
                            start_time: short_start_time,
                            end_time: short_end_time
                          }

      return render :new unless @shift.save
    end
    redirect_to shifts_path
  end

  private
  def shift_params
    params.require(:shift).permit(:start_time, :end_time,
                                  :day_of_week)
  end

  def short_start_time
    shift_params['start_time(4i)'] + ':' + shift_params['start_time(5i)']
  end

  def short_end_time
    shift_params['end_time(4i)'] + ':' + shift_params['end_time(5i)']
  end
end
