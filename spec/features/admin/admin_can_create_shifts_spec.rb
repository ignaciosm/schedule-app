require 'rails_helper'

RSpec.feature 'Admin can create shifts' do
  scenario 'they can see the shift on the shift index' do
    admin = create(:admin)
    sign_in admin
    monday = 'shift_day_of_week_monday'
    friday = 'shift_day_of_week_friday'
    start_time1 = '07'
    start_time2 = '30'
    end_time1 = '12'
    end_time2 = '00'
    position = 'Shift Lead'

    visit admin_path(admin)
    click_on t('admins.show.add_shift')
    check(monday)
    check(friday)
    select start_time1, from: 'shift_start_time_4i'
    select start_time2, from: 'shift_start_time_5i'
    select end_time1, from: 'shift_end_time_4i'
    select end_time2, from: 'shift_end_time_5i'
    select(position)
    click_on t('shifts.form.submit_button')

    expect(page).to have_content '07:30'
  end
end
