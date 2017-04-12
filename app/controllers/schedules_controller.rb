class SchedulesController < ApplicationController
  before_action :assign_schedule, only: [:show, :update,
                                         :set_schedule, :print_schedule,
                                         :add_employees, :remove_employees]

  def index
    @schedules = Schedule.current_admins_only(current_admin)
  end

  def show() end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.admin = current_admin

    if @schedule.save
      redirect_to schedule_path(@schedule)
    else
      render :new
    end
  end

  def update

  end

  def add_employees
    Employee.admins_employees(current_admin).each do |employee|
      @schedule.employees << employee if employee.status == 'active'
    end

    redirect_to schedule_path(@schedule)
  end

  def remove_employees
    @schedule.employees.delete_all

    redirect_to schedule_path(@schedule)
  end

  def set_schedule
    @set_schedule = true
  end

  def print_schedule
    @printable_view = true
  end

  private

  def assign_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:business_year, :business_week,
                                     shifts_attributes: [
                                       :id, :start_time, :end_time,
                                       :day_of_week, :employee_id
                                     ])
  end

  def add_schedule?
    unless @updated_shift.schedules.include?(@schedule)
      @updated_shift.schedules << @schedule
    end
  end
end
