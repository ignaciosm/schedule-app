class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :assign_shifts, :unassign_shifts]

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def assign_shifts
    Shift.all.map do |shift|
      @schedule.shifts << shift if shift.status == 'active'
    end

    redirect_to schedule_path(@schedule)
  end

  def unassign_shifts
    @schedule.shifts.delete_all

    redirect_to schedule_path(@schedule)
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
