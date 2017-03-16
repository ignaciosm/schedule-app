require 'rails_helper'

RSpec.feature 'admin can toggle active shifts belong to a schedule' do
  scenario 'by clicking button on schedule page to assign' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin_id: admin.id)
    shift = create(:shift, admin_id: admin.id)

    visit root_path
    click_on schedule.week_and_year
    click_on t('schedules.show.assign_shifts')

    expect(page).to have_content shift.start_time
  end

  scenario 'by clicking button on schedule page to unassign', js: true do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin_id: admin.id)
    shift = create(:shift, admin_id: admin.id)

    visit schedule_path(schedule)
    click_on t('schedules.show.unassign_shifts')
    page.accept_alert 'Are you sure?' do
      click_button('OK')
    end

    expect(page).to_not have_content shift.start_time
  end
end
