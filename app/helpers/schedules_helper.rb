module SchedulesHelper

  def employee_type(employee)
    if employee.class == Admin
      0
    else
      employee.id
    end
  end

  def shifts_created?(day, employee, schedule)
    if schedule.shifts.shifts_by_day_and_employee(day, employee).count == 0
      @schedule.shifts.build
    else
      schedule.shifts.shifts_by_day_and_employee(day, employee)
    end
  end
end
