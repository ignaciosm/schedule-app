class EmployeesController < ApplicationController
  before_action :assign_employee, only: [:show, :toggle_status, :edit, :update]

  def index
    redirect_to admin_path(current_admin)
  end

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

  def show
  end

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

  def toggle_status
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

  def assign_employee
    @employee = Employee.find(params[:id])
  end

  def not_your_employee
    @employee.admin_id != current_admin.id
  end
end
