class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :company
  validates_uniqueness_of :company
  has_many :schedules
  has_many :employees
  has_many :available_times

  def shifts_by_day_and_employee(day, schedule)
    schedule.shifts.where('employee_id = ?', 0).where('day_of_week = ?', day)
  end
end
