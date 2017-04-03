require 'rails_helper'

RSpec.feature 'Admin can edit employee' do
  scenario 'they can see the employee\'s page' do
    admin = create(:admin)
    sign_in admin
    create(:employee, admin: admin,
                      first_name: 'Boaty',
                      last_name:  'McBoatface')

    visit root_path
    click_on t('layouts.navigation.admin_page')
    click_on t('admins.show.edit_employee')
    select('Team Member')
    click_on 'Update Employee'

    within('.team-members') do
      expect(page).to have_content('Boaty M.')
    end
  end

  scenario 're-renders edit page when submitting improper data' do
    admin = create(:admin)
    sign_in admin
    create(:employee, admin: admin)

    visit root_path
    click_on  t('layouts.navigation.admin_page')
    click_on  t('admins.show.edit_employee')
    fill_in   'employee_first_name', with: ''
    click_on  'Update Employee'

    expect(page).to have_content 'First name can\'t be blank'
  end
end
