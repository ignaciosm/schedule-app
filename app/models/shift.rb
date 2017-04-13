class Shift < ApplicationRecord
  has_many :schedule_shifts
  has_many :schedules, through: :schedule_shifts

  def self.shifts_by_day(day)
    where('day_of_week = ?', day)
  end

  def self.shifts_by_employee(employee)
    if employee.class == Admin
      where('employee_id = ?', 0)
    else
      where('employee_id = ?', employee.id)
    end
  end

  def self.shifts_by_day_and_employee(day, employee)
    if employee.class == Admin
      where('employee_id = ?', 0).where('day_of_week = ?', day)
    else
      where('employee_id = ?', employee.id).where('day_of_week = ?', day)
    end
  end
end
