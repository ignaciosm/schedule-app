# This class handles the association between a schedule and its employees
# The create action associates all the active employees with the schedule
# The delete action removes all of the employees associated with the schedule

class AssociateEmployeesController < ApplicationController
  before_action :assign_schedule, only: [:create, :destroy]

  def create
    Employee.admins_employees(current_admin).each do |employee|
      @schedule.employees << employee if employee.status == 'active'
    end

    redirect_to schedule_path(@schedule)
  end

  def destroy
    @schedule.employees.delete_all

    redirect_to schedule_path(@schedule)
  end

  private

  def assign_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end
end
