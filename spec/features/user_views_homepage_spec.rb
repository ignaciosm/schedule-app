require 'rails_helper'

RSpec.feature 'User views homepage:' do
  scenario 'they see a list of schedules' do
    schedule = create(:schedule)
    link_text = "Week #{schedule.biz_week}, #{schedule.biz_year}"

    visit root_path

    expect(page).to have_link link_text, href: schedule_path(schedule)
  end
end
