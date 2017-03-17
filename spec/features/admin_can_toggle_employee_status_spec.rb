require 'rails_helper'

RSpec.feature 'admin can toggle employee status' do
  scenario 'clicking deactivate changes status to inactive' do
    admin = create(:admin)
    sign_in admin
    create(:employee, admin: admin)

    visit admin_path(admin)
    click_on t('employees.deactivate')

    expect(page).to have_css '.inactive_employee'
  end

  scenario 'clicking activate changes status to active' do
    admin = create(:admin)
    sign_in admin
    create(:employee, admin: admin, status: 'inactive')

    visit admin_path(admin)
    click_on t('employees.activate')

    expect(page).to have_css '.active_employee'
  end
end
