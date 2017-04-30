class ShiftsController < ApplicationController
  before_action :assign_schedule,       only: [:index, :create]
  before_action :load_employees,        only: [:index]
  before_action :load_employee_times,   only: [:index]
  before_action :load_schedule_shifts,  only: [:index]

  def index
    @set_schedule = true
  end

  def create
    shift_params[:shifts_attributes].values.each do |shift|
      if shift[:start_time].blank? && shift[:end_time].blank?
        @schedule.shifts.delete(shift[:id]) unless shift[:id].blank?
      elsif shift[:start_time].blank? || shift[:end_time].blank?
        next # do nothing if only one field is blank
      else
        @updated_shift = @schedule.shifts.find_or_initialize_by(id: shift[:id])
        @updated_shift.update(start_time:  shift[:start_time],
                              end_time:    shift[:end_time],
                              day_of_week: shift[:day_of_week],
                              employee_id: shift[:employee_id])
        add_schedule?
      end
    end
    flash[:complete] = t('flash.set_schedule')
    redirect_to schedule_path(@schedule)
  end

  private

  def shift_params
    params.require(:schedule).permit(shifts_attributes: [
                                       :id, :start_time, :end_time,
                                       :day_of_week, :employee_id
                                     ])
  end

  def add_schedule?
    return if @updated_shift.schedules.include?(@schedule)
    @updated_shift.schedules << @schedule
  end

  # Pulled from schedules controller

  def assign_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def load_employees
    @team_members = @schedule.employees.employees_by_position('Team Member')
    @shift_leads  = @schedule.employees.employees_by_position('Shift Lead')
  end

  def load_employee_times
    @employee_times = {}
    @schedule.employees.each_with_object({}) do |employee|
      @employee_times[employee] = employee.available_times
    end
  end

  def load_schedule_shifts
    @schedule_shifts = @schedule.shifts
  end
end
