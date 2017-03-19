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
