require 'rails_helper'

RSpec.feature 'Admin clicks schedule link' do
  scenario 'they see the schdule' do
    admin = create(:admin)
    sign_in admin
    @schedule = create(:schedule, admin: admin,
                                  business_year: 2017,
                                  business_week: 10)

    visit schedules_path
    click_on 'Week 10, 2017'

    expect(page).to have_content t('schedules.show.greeting',
                                   date1: grab_date1,
                                   date7: grab_date7,
                                   year: '2017')
  end

  scenario 'they see the week in the table header' do
    admin = create(:admin)
    sign_in admin
    @schedule = create(:schedule, admin: admin,
                                  business_year: 2017,
                                  business_week: 10)

    visit schedules_path
    click_on 'Week 10, 2017'

    expect(page).to have_content t('schedules.table.header_days.header',
                                   week: '10')
  end
end

# Make tests easier to read
def grab_date1
  Date.commercial(2017, 10, 1).strftime('%m/%d')
end

def grab_date7
  Date.commercial(2017, 10, 7).strftime('%m/%d')
end
