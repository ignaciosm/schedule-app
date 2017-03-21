require 'rails_helper'

RSpec.feature 'User views a schedule' do
  scenario 'they see the shifts for each employee' do
    admin = build(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    shift_lead = create(:employee, admin: admin)
    team_member = create(:employee, position: 'Team Member', admin: admin)
    shift_lead.shifts << shift1 = create(:shift)
    team_member.shifts << shift2 = create(:shift)

    visit schedule_path(schedule)
    click_on t('schedules.add_remove_employees.add_employees')

    expect(page).to have_content admin.first_name
    expect(page).to have_content shift1.start_time_end_time
    expect(page).to have_content shift2.start_time_end_time
  end
end
