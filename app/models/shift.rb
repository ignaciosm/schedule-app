class Shift < ApplicationRecord
  validates_presence_of :day_of_week, :start_time, :end_time
  belongs_to :admin
  has_many :schedule_shifts
  has_many :schedules, through: :schedule_shifts

  def self.active_shifts
    where('status = ?', 'active')
  end

end
