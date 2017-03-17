require 'rails_helper'

RSpec.feature 'Admin views homepage:' do
  scenario 'they see a list of only their schedules' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    schedule2 = create(:schedule, biz_week: 11)
    link_text = "Week #{schedule.biz_week}, #{schedule.biz_year}"
    link_text2 = "Week #{schedule2.biz_week}, #{schedule2.biz_year}"

    visit root_path

    expect(page).to_not have_link link_text2, href: schedule_path(schedule2)
    expect(page).to have_link link_text, href: schedule_path(schedule)
  end
end
