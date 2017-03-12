require 'rails_helper'

RSpec.feature 'User clicks schedule link' do
  scenario 'they see the schdule' do
    schedule = create(:schedule)

    visit root_path
    click_on 'Week 10, 2017'

    expect(page).to have_content t('schedules.show.header', week: schedule.week)
  end
end
