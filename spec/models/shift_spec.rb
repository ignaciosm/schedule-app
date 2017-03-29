RSpec.describe Shift, '.shifts_by_day(day)' do
  it 'returns shifts by day' do
    shift1 = create(:shift)
    shift2 = create(:shift, day_of_week: 'Tuesday')

    expect(Shift.shifts_by_day('Monday')).to eq [shift1]
    expect(Shift.shifts_by_day('Monday')).to_not eq [shift2]
  end
end

RSpec.describe Shift, 'shifts_by_employee(employee)' do
  it 'returns shift by employee' do
    employee = create(:employee)
    shift1 = create(:shift, employee_id: employee.id)
    shift2 = create(:shift)

    expect(Shift.shifts_by_employee(employee)).to eq [shift1]
    expect(Shift.shifts_by_employee(employee)).to_not eq [shift2]
  end
end
