class Schedule < ApplicationRecord
  belongs_to :admin
  has_many :schedule_shifts
  has_many :shifts, through: :schedule_shifts

  def week_and_year
    "Week #{biz_week}, #{biz_year}"
  end

  def get_dates(year, week, day)
    Date.commercial(year, week, day).strftime('%m/%d')
  end
end
