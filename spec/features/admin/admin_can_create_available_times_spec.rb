require 'rails_helper'

RSpec.feature 'Admin can create available times for employees' do
  scenario 'they can see the availability on the schedule show page' do
    admin = create(:admin)
    sign_in admin
    monday = 'available_time_day_of_week_monday'
    friday = 'available_time_day_of_week_friday'
    start_hour = '11 AM'
    start_minute = '00'
    end_hour = '03 PM'
    end_minute = '00'
    employee = create(:employee, admin: admin)

    visit admin_path(admin)
    click_on t('admins.show.add_available_time')
    check(monday)
    check(friday)
    select start_hour, from: 'available_time_start_time_4i'
    select start_minute, from: 'available_time_start_time_5i'
    select end_hour, from: 'available_time_end_time_4i'
    select end_minute, from: 'available_time_end_time_5i'
    select employee.first_name_last_initial, from: 'available_time[id]'
    click_on t('available_times.form.submit_button')

    expect(page).to have_content 'You have successfully added the employee\'s availability'
  end

  scenario 're-renders page with flash error with improper data' do
    admin = create(:admin)
    sign_in admin
    start_hour = '11 AM'
    start_minute = '00'
    end_hour = '03 PM'
    end_minute = '00'
    employee = create(:employee, admin: admin)

    visit admin_path(admin)
    click_on t('admins.show.add_available_time')
    select start_hour, from: 'available_time_start_time_4i'
    select start_minute, from: 'available_time_start_time_5i'
    select end_hour, from: 'available_time_end_time_4i'
    select end_minute, from: 'available_time_end_time_5i'
    select employee.first_name_last_initial, from: 'available_time[id]'
    click_on t('available_times.form.submit_button')

    expect(page).to have_content 'You must select at least one day'
  end
end
