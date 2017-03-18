RSpec.describe Schedule, 'validations' do
  it { is_expected.to validate_presence_of(:biz_year) }
  it { is_expected.to validate_presence_of(:biz_week) }
end
