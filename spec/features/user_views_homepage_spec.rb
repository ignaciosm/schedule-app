require 'rails_helper'

RSpec.feature 'User views homepage:' do
  scenario 'they see a list of schedules' do
    schedule = create(:schedule)

    visit root_path

    expect(page).to have_link schedule.year, href: schedule_path(schedule)
  end
end
