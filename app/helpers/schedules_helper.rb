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
end
