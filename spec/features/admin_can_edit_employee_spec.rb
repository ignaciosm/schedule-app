require 'rails_helper'

RSpec.feature 'Admin can edit employee' do
  scenario 'they can see the employee\'s page' do
    admin = create(:admin)
    sign_in admin
    employee = create(:employee, admin_id: admin.id)

    visit root_path
    click_on t('layouts.navigation.admin_page')
    click_on t('admins.show.edit_employee')
    fill_in 'employee_position', with: 'Team Member'
    click_on t('employees.form.submit_button')
    employee = Employee.last

    expect(employee.position).to eq 'Team Member'
    expect(page).to have_content employee.first_name_last_initial
  end
end
