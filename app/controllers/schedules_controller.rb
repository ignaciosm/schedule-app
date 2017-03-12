class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show]

  def index
    @schedules = Schedule.all
  end

  def show
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
