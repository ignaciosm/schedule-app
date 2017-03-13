class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :deactivate]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.admin_id = current_admin.id

    if @employee.save
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def show
  end

  def deactivate
    case @employee.status
    when 'active'
      @employee.update(status: 'inactive')
    when 'inactive'
      @employee.update(status: 'active')
    end
    redirect_to admin_path(current_admin)
  end

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :position)
  end

  def status_params
    params.require(:employee).permit(:status)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
