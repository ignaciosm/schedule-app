require 'rails_helper'

RSpec.feature 'Admin views schedules index' do
  scenario 'they see a list of only their schedules' do
    admin = create(:admin)
    sign_in admin
    schedule    = create(:schedule, admin: admin)
    schedule2   = create(:schedule, business_week: 11)
    link_text   = "Week #{schedule.business_week}, #{schedule.business_year}"
    link_text2  = "Week #{schedule2.business_week}, #{schedule2.business_year}"

    visit admin_path(admin)
    click_on 'View schedules'

    expect(page).to_not have_link link_text2, href: schedule_path(schedule2)
    expect(page).to     have_link link_text,  href: schedule_path(schedule)
  end
end
