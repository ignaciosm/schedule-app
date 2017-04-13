require 'rails_helper'

RSpec.feature 'admin can edit a set schedule' do
  scenario 'by clicking a button and updating employee shifts' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    employee = create(:employee, admin: admin)
    schedule.shifts << create(:shift, start_time:  '7:30 am',
                                      end_time:    '4:00 pm',
                                      day_of_week: 'Monday',
                                      employee_id: 0) # admin.id == 0
    schedule.shifts << create(:shift, start_time:  '12:00 pm',
                                      end_time:    '6:00 pm',
                                      day_of_week: 'Monday',
                                      employee_id: employee.id)
    visit schedule_path(schedule)
    click_on t('schedules.add_remove_employees.add_employees')

    click_on  t('schedules.show.set_schedule')
    fill_in   'schedule_shifts_attributes_0_start_time', with: '8:30 am'
    click_on  'Finalize schedule'

    expect(page).to have_content '8:30 am - 4:00 pm'
    expect(page).to have_content '12:00 pm - 6:00 pm'
    expect(page).to have_content 'You have set the schedule'
  end
end
