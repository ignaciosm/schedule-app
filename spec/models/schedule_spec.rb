RSpec.describe Schedule, 'validations' do
  it { is_expected.to validate_presence_of(:business_year) }
  it { is_expected.to validate_presence_of(:business_week) }
end
