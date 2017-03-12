RSpec.describe Employee, 'validations' do
  it {is_expected.to validate_presence_of(:first_name) }
  it {is_expected.to validate_presence_of(:last_name) }
  it {is_expected.to validate_presence_of(:position) }
end

RSpec.describe Employee, '.shift_leads' do
  it 'returns only the employees who are a shift lead' do
    shift_lead = create(:employee)
    team_member = create(:employee, :team_member)

    expect(Employee.shift_leads).to eq [shift_lead]
  end
end

RSpec.describe Employee, '.team_member' do
  it 'returns only the employees who are a shift lead' do
    shift_lead = create(:employee)
    team_member = create(:employee, :team_member)

    expect(Employee.team_members).to eq [team_member]
  end
end
