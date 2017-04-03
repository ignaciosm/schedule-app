require 'rails_helper'

RSpec.feature 'Admin can create new employee' do
  scenario 'they can see the employee in admins profile' do
    admin = create(:admin)
    sign_in admin
    employee_first_name = 'Tony'
    employee_last_name  = 'Stark'
    employee_position   = 'Shift Lead'

    visit root_path
    click_on  t('layouts.navigation.admin_page')
    click_on  t('admins.show.add_employee')
    fill_in   'employee_first_name',  with: employee_first_name
    fill_in   'employee_last_name',   with: employee_last_name
    select(employee_position)
    click_on 'Create Employee'

    expect(page).to have_content('Tony S.')
  end

  scenario 're-renders page when submitting improper data' do
    admin = create(:admin)
    sign_in admin
    employee_first_name = 'Tony'
    employee_last_name  = 'Stark'

    visit root_path
    click_on  t('layouts.navigation.admin_page')
    click_on  t('admins.show.add_employee')
    fill_in   'employee_first_name',  with: employee_first_name
    fill_in   'employee_last_name',   with: employee_last_name
    click_on  'Create Employee'

    expect(page).to have_content 'Position can\'t be blank'
  end
end
