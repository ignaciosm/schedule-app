require 'rails_helper'

RSpec.describe Shift, 'validations' do
  # Need to decide on validations
end

RSpec.describe Shift, '.active_shifts' do
  it 'returns only the active shifts' do
    active_shift = create(:shift)
    create(:shift, status: 'inactive')

    expect(Shift.active_shifts).to eq [active_shift]
  end
end
