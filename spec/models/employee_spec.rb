RSpec.describe Employee, 'validations' do
  it {is_expected.to validate_presence_of(:first_name) }
  it {is_expected.to validate_presence_of(:last_name) }
  it {is_expected.to validate_presence_of(:position) }
end

RSpec.describe Employee, '.shift_leads' do
  it 'returns only the employees who are a shift lead' do
    shift_lead = create(:employee)
    team_member = create(:employee, :team_member)

    expect(Employee.employees_by_position('Shift Lead')).to eq [shift_lead]
  end
end

RSpec.describe Employee, '.team_member' do
  it 'returns only the employees who are a shift lead' do
    shift_lead = create(:employee)
    team_member = create(:employee, :team_member)

    expect(Employee.employees_by_position('Team Member')).to eq [team_member]
  end
end

RSpec.describe Employee, '#first_name_last_initial' do
  it 'returns the first name and last initial' do
    shift_lead = create(:employee)

    expect(shift_lead.first_name_last_initial).to eq 'Boaty M.'
  end
end
