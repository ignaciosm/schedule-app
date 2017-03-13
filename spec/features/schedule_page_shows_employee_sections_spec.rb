require 'rails_helper'

RSpec.feature 'User views a schedule' do
  scenario 'they see a section for managers' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule)

    visit root_path
    click_on schedule.week_and_year

    expect(page).to have_content admin.name
  end
end
