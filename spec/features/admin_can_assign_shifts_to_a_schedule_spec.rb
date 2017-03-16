require 'rails_helper'

RSpec.feature 'admin can assign shifts' do
  scenario 'by clicking button on schedule page' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin_id: admin.id)
    shift = create(:shift, admin_id: admin.id)

    visit root_path
    click_on schedule.week_and_year
    click_on t('schedules.show.assign_shifts')

    expect(page).to have_content 'Shifts have been assigned'
  end
end