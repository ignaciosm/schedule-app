require 'rails_helper'

RSpec.feature 'admin can toggle active employees belong to a schedule' do
  scenario 'by clicking button on schedule page to assign' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin_id: admin.id)
    shift_lead = create(:employee, admin_id: admin.id)

    visit schedule_path(schedule)
    click_on t('schedules.show.assign_employees')

    expect(page).to have_content shift_lead.first_name_last_initial
  end

  scenario 'by clicking button on schedule page to unassign' do
    admin = create(:admin)
    sign_in admin
    schedule = create(:schedule, admin_id: admin.id)
    shift_lead = create(:employee, admin_id: admin.id)

    visit schedule_path(schedule)
    click_on t('schedules.show.assign_employees')

    visit schedule_path(schedule)
    click_on t('schedules.show.unassign_employees')

    expect(page).to_not have_content shift_lead.first_name_last_initial
  end
end
