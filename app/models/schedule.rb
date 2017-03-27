class Schedule < ApplicationRecord
  validates_presence_of :biz_year, :biz_week
  belongs_to :admin
  has_many :schedule_available_times
  has_many :available_times, through: :schedule_available_times
  has_many :schedule_employees
  has_many :employees, through: :schedule_employees
  has_many :schedule_shifts
  has_many :shifts, through: :schedule_shifts
  accepts_nested_attributes_for :shifts

  def week_and_year
    "Week #{biz_week}, #{biz_year}"
  end

  def get_dates(year, week, day)
    Date.commercial(year, week, day).strftime('%m/%d')
  end

  def self.current_admins_only(admin)
    where('admin_id = ?', admin)
  end
  # def shifts_attributes=(shift_attributes)
  #   shift_attributes.each do |shift_attr|
  #     shift_attr.values.each do |shift_attribute|
  #       binding.pry
  #       shift = Shift.create(start_time: shift_attribute[:start_time],
  #                           end_time: shift_attribute[:end_time])
  #       self.schedule_shifts.build(shift_id: shift.id)
  #     end
  #   end
  # end
end
