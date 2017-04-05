require 'rails_helper'

RSpec.feature 'admin can create a schedule' do
  scenario 'they can see the schedule on the index page' do
    admin = create(:admin)
    sign_in admin
    schedule_year = 2017
    schedule_week = 13

    visit admin_path(admin)
    click_on t('admins.show.add_schedule')
    fill_in 'schedule_business_year', with: schedule_year
    fill_in 'schedule_business_week', with: schedule_week
    click_on t('helpers.submit.create', model: Schedule)

    expect(page).to have_content('Week of 03/27 to 04/02, 2017')
  end

  scenario 're-renders page when submitting improper data' do
    admin = create(:admin)
    sign_in admin
    schedule_year = 2017

    visit admin_path(admin)
    click_on t('admins.show.add_schedule')
    fill_in 'schedule_business_year', with: schedule_year
    click_on t('helpers.submit.create', model: Schedule)

    expect(page).to have_content 'Business week can\'t be blank'
  end
end
