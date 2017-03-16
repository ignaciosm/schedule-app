class Shift < ApplicationRecord
  belongs_to :admin
  has_many :schedule_shifts
  has_many :schedules, through: :schedule_shifts
end
