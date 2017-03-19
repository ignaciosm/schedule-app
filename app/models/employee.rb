class Employee < ApplicationRecord
  validates_presence_of :first_name, :last_name, :position
  belongs_to :admin
  has_many :schedule_employees
  has_many :schedules, through: :schedule_employees
  has_many :employee_shifts
  has_many :shifts, through: :employee_shifts

  def first_name_last_initial
    "#{first_name} #{last_name[0]}."
  end

  def self.inactive_employees
    where('status = ?', 'inactive').order('first_name')
  end

  def self.employees_by_position(position)
    where('position = ?', position).where('status = ?', 'active').order('first_name')
  end
end
