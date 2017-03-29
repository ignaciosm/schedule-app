class AvailableTimesController < ApplicationController
  def new
    @available_time = AvailableTime.new
  end

  def create
    @available_time = AvailableTime.new(available_time_params)
    if params[:available_time][:day_of_week].nil?
      flash[:error] = "You must select at least one day"
      return render :new
    end
    params[:available_time][:day_of_week].each do |day|
      @available_time.attributes = { day_of_week: day,
                            admin_id: current_admin.id,
                            start_time: short_start_time,
                            end_time: short_end_time
                          }

      return render :new unless @available_time.save
      @employee = Employee.find(params[:available_time][:id])
      @employee.available_times << @available_time
    end

    redirect_to employee_path(@employee)
  end

  private
  def available_time_params
    params.require(:available_time).permit(:start_time, :end_time, :day_of_week)
  end

  def short_start_time
    available_time_params['start_time(4i)'] + ':' + available_time_params['start_time(5i)']
  end

  def short_end_time
    available_time_params['end_time(4i)'] + ':' + available_time_params['end_time(5i)']
  end
end
