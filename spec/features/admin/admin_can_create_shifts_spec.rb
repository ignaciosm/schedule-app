require 'rails_helper'

RSpec.feature 'Admin can create shifts' do
  scenario 'they can see the shift on the shift index' do
    admin = create(:admin)
    sign_in admin
    day_of_week = 'Monday'
    start_time = '07:30'
    end_time = '12:00'
    position = 'Shift Lead'

    visit admin_path(admin)
    click_on t('admins.show.add_shift')
    fill_in 'shift_day_of_week', with: day_of_week
    fill_in 'shift_start_time', with: start_time
    fill_in 'shift_end_time', with: end_time
    choose(position)
    click_on t('shifts.form.submit_button')

    expect(page).to have_content '07:30 am'
  end
end
