class AvailableTimesController < ApplicationController
  before_action :no_days_selected?, only: :create
  def new
    @available_time = AvailableTime.new
  end

  def create
    params[:available_time][:day_of_week].each do |day|
      generate_available_time
      @available_time.attributes = { day_of_week: day,
                                     admin_id: current_admin.id,
                                     start_time: short_start_time,
                                     end_time: short_end_time }

      return render :new unless @available_time.save
      Employee.assign_employee_times(params[:available_time][:id],
                                     @available_time)
    end
    flash[:success] = 'You have successfully added availability'
    redirect_to admin_path(current_admin)
  end

  private

  def available_time_params
    params.require(:available_time).permit(:start_time, :end_time, :day_of_week)
  end

  def short_start_time
    available_time_params['start_time(4i)'] + ':' +
      available_time_params['start_time(5i)']
  end

  def short_end_time
    available_time_params['end_time(4i)'] + ':' +
      available_time_params['end_time(5i)']
  end

  def no_days_selected?
    if params[:available_time][:day_of_week].nil?
      generate_available_time
      flash[:error] = 'You must select at least one day'
      render :new
    end
  end

  def generate_available_time
    @available_time = AvailableTime.new(available_time_params)
  end
end
