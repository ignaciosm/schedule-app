require 'rails_helper'

RSpec.feature 'Admin views schedules index' do
  scenario 'they see a list of only their schedules' do
    admin = create(:admin)
    sign_in admin
    schedule    = create(:schedule, admin: admin,
                                    business_year: 2017,
                                    business_week: 10)
    schedule2   = create(:schedule, business_year: 2017,
                                    business_week: 11)
    link_text   = 'Week 10, 2017'
    link_text2  = 'Week 11, 2017'

    visit admin_path(admin)
    click_on t('admins.show.view_schedules')

    expect(page).to_not have_link link_text2, href: schedule_path(schedule2)
    expect(page).to     have_link link_text,  href: schedule_path(schedule)
  end
end
