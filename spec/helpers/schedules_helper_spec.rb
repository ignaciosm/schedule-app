require 'rails_helper'

RSpec.describe SchedulesHelper, '#shifts_created?(day, employee, schedule)' do
  it 'returns shifts by day and employee' do
    schedule = create(:schedule)
    schedule.employees  << shift_lead  = create(:employee)
    schedule.shifts     << shift       = create(:shift,
                                                employee_id: shift_lead.id,
                                                start_time:  '2:30 pm',
                                                end_time:    '7:30 pm',
                                                day_of_week: 'Monday')

    shifts = helper.shifts_created?('Monday', shift_lead, schedule)
    expect(shifts).to eq [shift]
  end
end
