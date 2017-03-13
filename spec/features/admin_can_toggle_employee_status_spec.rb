require 'rails_helper'

RSpec.feature 'admin can toggle employee status' do
  scenario 'clicking deactivate changes status to deactive' do
    admin = create(:admin)
    sign_in admin
    employee = create(:employee, admin_id: admin.id)

    visit admin_path(admin)
    click_link deactivate_path(employee)

    expect(employee.status).to eq 'Deactive'
  end
end
