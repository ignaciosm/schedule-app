require 'rails_helper'

RSpec.feature 'Admin can edit employee' do
  scenario 'they can see the employee\'s page' do
    admin = create(:admin)
    sign_in admin
    create(:employee, admin: admin)

    visit root_path
    click_on t('layouts.navigation.admin_page')
    click_on t('admins.show.edit_employee')
    select('Team Member')
    click_on 'Update Employee'
    employee = Employee.last

    expect(employee.position).to eq 'Team Member'
    expect(page).to have_content employee.first_name_last_initial
  end
end
