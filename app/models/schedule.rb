class Schedule < ApplicationRecord
  validates_presence_of :biz_year, :biz_week
  belongs_to :admin
  has_many :schedule_available_times
  has_many :available_times, through: :schedule_available_times
  has_many :schedule_employees
  has_many :employees, through: :schedule_employees

  def week_and_year
    "Week #{biz_week}, #{biz_year}"
  end

  def get_dates(year, week, day)
    Date.commercial(year, week, day).strftime('%m/%d')
  end

  def self.current_admins_only(admin)
    where('admin_id = ?', admin)
  end
end
