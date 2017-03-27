require 'rails_helper'

RSpec.feature 'admin can print a set schedule' do
  scenario 'by clicking a button to display a printable schedule' do
    admin = build(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    schedule.employees << shift_lead  = create(:employee, admin: admin)
    schedule.employees << team_member = create(:employee,
                                               position: 'Team Member',
                                               admin: admin)
    schedule.shifts << build(:shift, employee_id: 0)
    schedule.shifts << build(:shift, employee_id: shift_lead.id,
                                     start_time:  '2:30 pm',
                                     end_time:    '7:30 pm')
    schedule.shifts << build(:shift, employee_id: team_member.id,
                                     start_time:  '12:00 pm',
                                     end_time:    '6:00 pm')

    visit schedule_path(schedule)
    click_on t('schedules.show.print_schedule')

    expect(page).to have_content '7:30 am to 4:00 pm'
    expect(page).to have_content '2:30 pm to 7:30 pm'
    expect(page).to have_content '12:00 pm to 6:00 pm'
    expect(page).to have_content 'Print schedule'
  end
end
