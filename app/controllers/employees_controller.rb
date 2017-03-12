class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
  end

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :position)
  end
end
