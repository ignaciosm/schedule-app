require 'rails_helper'

RSpec.feature 'User views a schedule' do
  scenario 'they see a section for each employee position' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule)
    shift_lead = create(:employee)
    team_member = create(:employee, :team_member)

    visit root_path
    click_on schedule.week_and_year

    expect(page).to have_content admin.name
    expect(page).to have_content shift_lead.first_name_last_initial
    expect(page).to have_content team_member.first_name_last_initial
  end
end
