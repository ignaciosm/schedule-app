class Shift < ApplicationRecord
  has_many :employee_shifts
  has_many :employees, through: :employee_shifts
  has_many :schedule_shifts
  has_many :schedules, through: :schedule_shifts
end
