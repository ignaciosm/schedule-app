class EmployeesController < ApplicationController
  before_action :assign_employee, only: [:show, :edit, :update]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.admin_id = current_admin.id

    if @employee.save
      redirect_to admin_path(current_admin)
    else
      render :new
    end
  end

  def show() end

  def edit
    redirect_to admin_path(current_admin) if not_your_employee
  end

  def update
    @employee.update(employee_params)
    if @employee.valid?
      redirect_to admin_path(current_admin)
    else
      render :edit
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :position)
  end

  def assign_employee
    @employee ||= Employee.find(params[:id])
  end

  def not_your_employee
    @employee.admin != current_admin
  end
end
