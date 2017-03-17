require 'rails_helper'

RSpec.feature 'admin can toggle active shifts belong to a schedule' do
  scenario 'by clicking button on schedule page to assign' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    shift = create(:shift, admin: admin)

    visit schedule_path(schedule)
    click_on t('schedules.toggle_shifts.assign_shifts')

    expect(page).to have_content shift.start_time
  end

  scenario 'by clicking button on schedule page to unassign' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    shift = create(:shift, admin: admin)

    visit schedule_path(schedule)
    click_on t('schedules.toggle_shifts.assign_shifts')

    visit schedule_path(schedule)
    click_on t('schedules.toggle_shifts.unassign_shifts')

    expect(page).to_not have_content shift.start_time
  end
end
