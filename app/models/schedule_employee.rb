class ScheduleEmployee < ApplicationRecord
  belongs_to :schedule
  belongs_to :employee
end
