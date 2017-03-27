require 'rails_helper'

RSpec.feature 'admin can set a schedule' do
  scenario 'by clicking a button and filling in employee shifts' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    shift_lead = create(:employee, admin: admin)
    team_member = create(:employee, position: 'Team Member', admin: admin)
    shift_lead.available_times << available_time = create(:available_time)
    team_member.available_times << available_time = create(:available_time)
    visit schedule_path(schedule)
    click_on t('schedules.add_remove_employees.add_employees')

    click_on t('schedules.show.set_schedule')
    fill_in 'schedule_shifts_attributes_0_start_time', with: '7:30 am'
    fill_in 'schedule_shifts_attributes_0_end_time', with: '4:00 pm'
    fill_in 'schedule_shifts_attributes_7_start_time', with: '3:30 pm'
    fill_in 'schedule_shifts_attributes_7_end_time', with: '7:30 pm'
    fill_in 'schedule_shifts_attributes_14_start_time', with: '12:00 pm'
    fill_in 'schedule_shifts_attributes_14_end_time', with: '4:00 pm'
    click_on 'Finalize schedule'

    expect(page).to have_content '7:30 am to 4:00 pm'
    expect(page).to have_content '3:30 pm to 7:30 pm'
    expect(page).to have_content '12:00 pm to 4:00 pm'
  end
end
