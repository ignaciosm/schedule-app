class Employee < ApplicationRecord
  validates_presence_of :first_name, :last_name, :position
  belongs_to :admin
  has_many :schedule_employees
  has_many :schedules, through: :schedule_employees
  has_many :employee_available_times
  has_many :available_times, through: :employee_available_times

  def first_name_last_initial
    "#{first_name} #{last_name[0]}."
  end

  def self.inactive_employees
    where('status = ?', 'inactive').order('first_name')
  end

  def self.employees_by_position(position)
    where('position = ?', position)
      .where('status = ?', 'active')
      .order('first_name')
  end

  def self.admins_employees(admin)
    where('admin_id = ?', admin)
  end

  def shifts_by_day_and_employee(day, schedule)
    schedule.shifts.where('employee_id = ?', id)
            .where('day_of_week = ?', day)
  end

  def self.assign_employee_times(id, time)
    find(id).available_times << time
  end
end
