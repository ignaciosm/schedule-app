require 'rails_helper'

RSpec.feature 'Admin clicks schedule link' do
  scenario 'they see the schdule' do
    admin = create(:admin)
    sign_in admin
    @schedule = create(:schedule, admin: admin)

    visit schedules_path
    click_on @schedule.week_and_year

    expect(page).to have_content t('schedules.show.greeting',
                                   date1: get_date1,
                                   date7: get_date7,
                                   year: @schedule.business_year)
  end

  scenario 'they see the week in the table header' do
    admin = create(:admin)
    sign_in admin
    @schedule = create(:schedule, admin: admin)

    visit schedules_path
    click_on @schedule.week_and_year

    expect(page).to have_content t('schedules.table.header_days.header',
                                   week: @schedule.business_week)
  end
end

# Make tests easier to read
def get_date1
  Date.commercial(@schedule.business_year, @schedule.business_week, 1).strftime('%m/%d')
end

def get_date7
  Date.commercial(@schedule.business_year, @schedule.business_week, 7).strftime('%m/%d')
end
