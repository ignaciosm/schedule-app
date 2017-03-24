class ScheduleShift < ApplicationRecord
  belongs_to :schedule
  belongs_to :shift
end
