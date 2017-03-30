RSpec.describe Admin, 'validations' do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:company) }
  it { is_expected.to validate_uniqueness_of(:company) }
end
