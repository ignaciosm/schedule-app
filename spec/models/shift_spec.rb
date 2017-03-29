RSpec.describe Shift, '.shifts_by_day(day)' do
  it 'returns shifts by day' do
    shift1 = create(:shift)
    shift2 = create(:shift, day_of_week: 'Tuesday')

    expect(Shift.shifts_by_day('Monday')).to eq [shift1]
    expect(Shift.shifts_by_day('Tuesday')).to eq [shift2]
  end
end
