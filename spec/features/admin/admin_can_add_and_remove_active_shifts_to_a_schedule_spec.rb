require 'rails_helper'

RSpec.feature 'admin can add and remove active shifts to a schedule' do
  scenario 'by clicking button on schedule page to add' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    shift = create(:shift, admin: admin)

    visit schedule_path(schedule)
    click_on t('schedules.toggle_shifts.add_shifts')

    expect(page).to have_content shift.start_time
  end

  scenario 'by clicking button on schedule page to remove' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin: admin)
    shift = create(:shift, admin: admin)

    visit schedule_path(schedule)
    click_on t('schedules.toggle_shifts.add_shifts')

    visit schedule_path(schedule)
    click_on t('schedules.toggle_shifts.remove_shifts')

    expect(page).to_not have_content shift.start_time
  end
end
