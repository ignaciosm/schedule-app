require 'rails_helper'

RSpec.feature 'Admin can create shifts' do
  scenario 'they can see the shift on the shift index' do
    admin = create(:admin)
    sign_in admin
    monday = 'shift_day_of_week_monday'
    friday = 'shift_day_of_week_friday'
    start_hour = '11 AM'
    start_minute = '00'
    end_hour = '03 PM'
    end_minute = '00'
    employee = create(:employee, admin: admin_can_add_and_remove_active_employees_to_a_schedule_spec.rb)

    visit admin_path(admin)
    click_on t('admins.show.add_shift')
    check(monday)
    check(friday)
    select start_hour, from: 'shift_start_time_4i'
    select start_minute, from: 'shift_start_time_5i'
    select end_hour, from: 'shift_end_time_4i'
    select end_minute, from: 'shift_end_time_5i'
    select(employee)
    click_on t('shifts.form.submit_button')

    expect(page).to have_content '11:00'
  end
end
