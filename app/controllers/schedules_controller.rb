class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :assign_shifts]

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def assign_shifts # later change to active shifts
    Shift.all.map do |shift|
      ScheduleShift.create(shift_id: shift.id, schedule_id: @schedule.id)
    end

    redirect_to schedule_path(@schedule)
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
