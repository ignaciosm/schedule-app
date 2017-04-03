require 'rails_helper'

RSpec.feature 'admin can add/remove their active employees to a schedule' do
  scenario 'by clicking button on schedule page to add' do
    admin = build(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    create(:employee, admin: admin,
                      first_name: 'Boaty',
                      last_name:  'McBoatface')
    create(:employee, first_name: 'Sam',
                      last_name:  'McBoatface')

    visit schedule_path(schedule)
    click_on t('schedules.add_remove_employees.add_employees')

    expect(page).to     have_content('Boaty M.')
    expect(page).to_not have_content('Sam M.')
  end

  scenario 'by clicking button on schedule page to remove' do
    admin = build(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    create(:employee, admin: admin,
                      first_name: 'Boaty',
                      last_name:  'McBoatface')

    visit schedule_path(schedule)
    click_on t('schedules.add_remove_employees.add_employees')
    click_on t('schedules.add_remove_employees.remove_employees')

    expect(page).to_not have_content('Boaty M.')
  end
end
