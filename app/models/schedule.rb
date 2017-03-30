class Schedule < ApplicationRecord
  validates_presence_of :business_year, :business_week
  belongs_to :admin
  has_many :schedule_available_times
  has_many :available_times, through: :schedule_available_times
  has_many :schedule_employees
  has_many :employees, through: :schedule_employees
  has_many :schedule_shifts
  has_many :shifts, through: :schedule_shifts
  accepts_nested_attributes_for :shifts

  def week_and_year
    "Week #{business_week}, #{business_year}"
  end

  def grab_dates(year, week, day)
    Date.commercial(year, week, day).strftime('%m/%d')
  end

  def self.current_admins_only(admin)
    where('admin_id = ?', admin)
  end
end
