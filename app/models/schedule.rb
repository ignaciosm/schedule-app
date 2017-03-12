class Schedule < ApplicationRecord
  belongs_to :admin

  def week_and_year
    "Week #{biz_week}, #{biz_year}"
  end
end
