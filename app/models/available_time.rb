class AvailableTime < ApplicationRecord
  validates_presence_of :day_of_week, :start_time, :end_time
  belongs_to :admin
  has_many :employee_available_times
  has_many :employees, through: :employee_available_times

  def self.available_times_by_day(day)
    where('day_of_week = ?', day)
  end

  def start_time_end_time
    start_time.strftime('%I:%M %p') + ' to ' + end_time.strftime('%I:%M %p')
  end
end
