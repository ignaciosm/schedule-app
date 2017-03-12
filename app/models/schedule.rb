class Schedule < ApplicationRecord

  def week_and_year
    "Week #{biz_week}, #{biz_year}"
  end
end
