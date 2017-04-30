class StatusController < ApplicationController
  def update
    @employee = Employee.find(params[:employee_id])

    case @employee.status
    when 'active'
      @employee.update(status: 'inactive')
    when 'inactive'
      @employee.update(status: 'active')
    end
    redirect_to admin_path(current_admin)
  end
end
