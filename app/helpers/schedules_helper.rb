module SchedulesHelper

  def employee_type(employee)
    if employee.class == Admin
      0
    else
      employee.id
    end
  end
end
