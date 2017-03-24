class Shift < ApplicationRecord
  has_many :schedule_shifts
  has_many :schedules, through: :schedule_shifts
end
