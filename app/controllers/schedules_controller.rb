class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show,
                                      :assign_shifts, :unassign_shifts,
                                      :assign_employees, :unassign_employees]

  def index
    @schedules = Schedule.current_admins_only(current_admin)
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def assign_shifts
    Shift.all.each do |shift|
      @schedule.shifts << shift if shift.status == 'active'
    end

    redirect_to schedule_path(@schedule)
  end

  def unassign_shifts
    @schedule.shifts.delete_all

    redirect_to schedule_path(@schedule)
  end

  def assign_employees
    Employee.all.each do |employee|
      @schedule.employees << employee if employee.status == 'active'
    end

    redirect_to schedule_path(@schedule)
  end

  def unassign_employees
    @schedule.employees.delete_all

    redirect_to schedule_path(@schedule)
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
