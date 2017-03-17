require 'rails_helper'

RSpec.feature 'Admin can create new employee' do
  scenario 'they can see the employee in admins profile' do
    admin = create(:admin)
    sign_in admin
    employee_first_name = 'Tony'
    employee_last_name = 'Stark'
    employee_position = 'Shift Lead'

    visit root_path
    click_on t('layouts.navigation.admin_page')
    click_on t('admins.show.add_employee')
    fill_in 'employee_first_name', with: employee_first_name
    fill_in 'employee_last_name', with: employee_last_name
    select(employee_position)
    click_on 'Create Employee'
    employee = Employee.last

    expect(page).to have_content employee.first_name_last_initial
  end
end
