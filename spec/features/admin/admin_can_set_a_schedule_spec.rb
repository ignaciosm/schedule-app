require 'rails_helper'

RSpec.feature 'admin can set a schedule' do
  scenario 'by clicking a button and filling in employee shifts' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    employee = create(:employee, admin: admin)
    employee.available_times << available_time = create(:available_time)
    visit schedule_path(schedule)
    click_on t('schedules.add_remove_employees.add_employees')

    click_on t('schedules.show.edit_schedule')
    fill_in 'schedule_shifts_attributes_0_start_time', with: '07:30 AM'
    fill_in 'schedule_shifts_attributes_0_end_time', with: '04:00 PM'
    click_on 'Finalize schedule'

    expect(page).to have_content '07:30 AM'
  end
end
