RSpec.describe Shift, '.shifts_by_day(day)' do
  it 'returns shifts by day' do
    shift1 = create(:shift)
    shift2 = create(:shift, day_of_week: 'Tuesday')

    expect(Shift.shifts_by_day('Monday')).to      eq [shift1]
    expect(Shift.shifts_by_day('Monday')).to_not  eq [shift2]
  end
end

RSpec.describe Shift, 'shifts_by_employee(employee)' do
  it 'returns shift by employee' do
    admin     = create(:admin)
    employee  = create(:employee)
    shift1    = create(:shift, employee_id: employee.id)
    shift2    = create(:shift, employee_id: 0) # tests for admin shift

    expect(Shift.shifts_by_employee(employee)).to     eq [shift1]
    expect(Shift.shifts_by_employee(employee)).to_not eq [shift2]
    expect(Shift.shifts_by_employee(admin)).to        eq [shift2]
  end
end

RSpec.describe Shift, '.shifts_by_day_and_employee(day, employee)' do
  it 'returns shifts by employee' do
    employee  = create(:employee)
    shift1    = create(:shift, employee_id: employee.id)
    shift2    = create(:shift, employee_id: employee.id, day_of_week: 'Tuesday')

    expect(Shift.shifts_by_day_and_employee('Monday', employee)).to     eq [shift1]
    expect(Shift.shifts_by_day_and_employee('Monday', employee)).to_not eq [shift2]
  end
end
