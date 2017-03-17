require 'rails_helper'

RSpec.describe Shift, 'validations' do
  # Do to decide on validations
end

RSpec.describe Shift, '.active_shifts' do
  it 'returns only the active shifts' do
    active_shift = create(:shift)
    inactive_shift = create(:shift, :inactive_shift)

    expect(Shift.active_shifts('active')).to eq [active_shift]
  end
end
