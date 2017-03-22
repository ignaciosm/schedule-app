class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :finalize,
                                      :add_employees, :remove_employees]

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

  def finalize
    @finalize_schedule = 'Finalize schedule'
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:biz_year, :biz_week)
  end
end
