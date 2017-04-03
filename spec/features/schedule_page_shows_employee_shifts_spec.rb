require 'rails_helper'

RSpec.feature 'User views a schedule' do
  scenario 'they see the shifts for each employee' do
    admin = build(:admin, first_name: 'Bruce')
    sign_in admin
    schedule    = create(:schedule, admin: admin)
    shift_lead  = create(:employee, admin: admin)
    team_member = create(:employee, admin: admin, position: 'Team Member')
    shift_lead.available_times  << create(:available_time, day_of_week: 'Monday',
                                                           start_time:  '11:00',
                                                           end_time:    '15:00')
    team_member.available_times << create(:available_time, day_of_week: 'Tuesday',
                                                           start_time:  '07:30',
                                                           end_time:    '12:00')

    visit schedule_path(schedule)
    click_on t('schedules.add_remove_employees.add_employees')

    expect(page).to have_content('Bruce')
    expect(page).to have_content('11:00 AM - 03:00 PM')
    expect(page).to have_content('07:30 AM - 12:00 PM')
  end
end
