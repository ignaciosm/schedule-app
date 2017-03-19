require 'rails_helper'

RSpec.feature 'admin can import/remove active shifts to a schedule' do
  scenario 'by clicking button on schedule page to import' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    shift = create(:shift, admin: admin)

    visit schedule_path(schedule)
    click_on t('schedules.toggle_shifts.import_shifts')

    expect(page).to have_content shift.start_time
  end

  scenario 'by clicking button on schedule page to remove' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    shift = create(:shift, admin: admin)

    visit schedule_path(schedule)
    click_on t('schedules.toggle_shifts.import_shifts')

    visit schedule_path(schedule)
    click_on t('schedules.toggle_shifts.remove_shifts')

    expect(page).to_not have_content shift.start_time
  end
end
