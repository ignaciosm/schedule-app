require 'rails_helper'

RSpec.describe AvailableTime, 'validations' do
  it { is_expected.to validate_presence_of(:day_of_week) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
end

RSpec.describe AvailableTime, '.available_times_by_day' do
  it 'returns the day of the week passed in' do
    monday = create(:available_time)
    create(:available_time, day_of_week: 'Tuesday')

    expect(AvailableTime.available_times_by_day('Monday')).to eq [monday]
  end
end

RSpec.describe AvailableTime, '#start_time_end_time' do
  it 'returns the available_time times formatted' do
    available_time = create(:available_time, start_time: '11:00',
                                             end_time:   '15:00')

    expect(available_time.start_time_end_time).to eq '11:00 AM - 03:00 PM'
  end
end
