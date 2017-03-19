require 'rails_helper'

RSpec.describe Shift, 'validations' do
  it { is_expected.to validate_presence_of(:day_of_week) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
end

RSpec.describe Shift, '.active_shifts' do
  it 'returns only the active shifts' do
    active_shift = create(:shift)
    create(:shift, status: 'inactive')

    expect(Shift.active_shifts).to eq [active_shift]
  end
end

RSpec.describe Shift, '.shifts_by_day' do
  it 'returns the day of the week passed in' do
    monday = create(:shift)
    create(:shift, day_of_week: 'Tuesday')

    expect(Shift.shifts_by_day('Monday')).to eq [monday]
  end
end

RSpec.describe Shift, '#start_time_end_time' do
  it 'returns the shift times formatted' do
    shift = create(:shift)

    expect(shift.start_time_end_time).to eq '11:00 AM to 03:00 PM'
  end
end
