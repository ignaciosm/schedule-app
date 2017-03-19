require 'rails_helper'

RSpec.feature 'User views a schedule' do
  scenario 'they see a section for each employee position' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    shift_lead = create(:employee, admin: admin)
    team_member = create(:employee, position: 'Team Member', admin: admin)

    visit schedule_path(schedule)
    click_on t('schedules.add_remove_employees.add_employees')

    expect(page).to have_content admin.first_name
    expect(page).to have_content shift_lead.first_name_last_initial
    expect(page).to have_content team_member.first_name_last_initial
  end
end
