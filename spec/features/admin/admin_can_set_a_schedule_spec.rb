require 'rails_helper'

RSpec.feature 'admin can set a schedule' do
  scenario 'by clicking a button and filling in employee shifts' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    employee = create(:employee, admin: admin)
    employee.shifts << shift = create(:shift)
    visit schedule_path(schedule)
    click_on t('schedules.add_remove_employees.add_employees')

    click_on t('schedules.show.set_schedule')
    click_on 'Finalize schedule'

    expect(page).to have_content 'Final schedule'
  end
end
