class SchedulesController < ApplicationController
  before_action :assign_schedule,       only: [:show,
                                               :set_schedule,  :print_schedule,
                                               :add_employees, :remove_employees]
  before_action :load_employees,        only: [:show, :set_schedule,
                                               :print_schedule]
  before_action :load_employee_times,   only: [:show, :set_schedule,
                                               :print_schedule]
  before_action :load_schedule_shifts,  only: [:show, :set_schedule,
                                               :print_schedule]

  def index
    @schedules = Schedule.current_admins_only(current_admin)
  end

  def show

  end

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
    params.require(:schedule).permit(:business_year, :business_week)
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
