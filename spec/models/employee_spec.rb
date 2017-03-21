RSpec.describe Employee, 'validations' do
  it {is_expected.to validate_presence_of(:first_name) }
  it {is_expected.to validate_presence_of(:last_name) }
  it {is_expected.to validate_presence_of(:position) }
end

RSpec.describe Employee, '.employees_by_position' do
  it 'returns only the employees who\'s position is passed' do
    shift_lead = create(:employee)
    team_member = create(:employee, position: 'Team Member')

    expect(Employee.employees_by_position('Shift Lead')).to eq [shift_lead]
    expect(Employee.employees_by_position('Team Member')).to eq [team_member]
  end
end

RSpec.describe Employee, '#first_name_last_initial' do
  it 'returns the first name and last initial' do
    shift_lead = build(:employee)

    expect(shift_lead.first_name_last_initial).to eq 'Boaty M.'
  end
end

RSpec.describe Employee, '.inactive_employees' do
  it 'returns only inactive employees' do
    employee1 = create(:employee)
    employee2 = create(:employee, status: 'inactive')

    expect(Employee.inactive_employees).to eq [employee2]
    expect(Employee.inactive_employees).to_not eq [employee1]
  end
end

RSpec.describe Employee, '.admins_employees' do
  it 'returns only admins employees' do
    admin = build(:admin)
    employee1 = create(:employee, admin: admin)
    employee2 = create(:employee)

    expect(Employee.admins_employees(admin)).to eq [employee1]
    expect(Employee.admins_employees(admin)).to_not eq [employee2]
  end
end
