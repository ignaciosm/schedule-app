module SchedulesHelper

  def employee_type(employee)
    employee.class == Admin ? 0 : employee.id
  end

  def shifts_created?(day, employee, schedule)
    if schedule.shifts.shifts_by_day_and_employee(day, employee).count.zero?
      @schedule.shifts.build
    else
      schedule.shifts.shifts_by_day_and_employee(day, employee)
    end
  end

  def select_employee_times(day, employee, employee_times)
    employee_times[employee].select { |time| time.day_of_week == day }
  end

  def select_shifts_by_day_and_employee(day, employee, schedule_shifts)
    emp_id = employee.has_attribute?(:admin_id) ? employee.id : 0
    schedule_shifts.select do |shift|
      shift.employee_id == emp_id && shift.day_of_week == day
    end
  end
end
