require 'rails_helper'

RSpec.feature 'User clicks schedule link' do
  scenario 'they see the schdule' do
    @schedule = create(:schedule)

    visit root_path
    click_on 'Week 10, 2017'

    expect(page).to have_content t('schedules.show.greeting',
                                   date1: get_date1, date7: get_date7,
                                   year: @schedule.biz_year)
  end

  scenario 'they see the week in the table header' do
    @schedule = create(:schedule)

    visit root_path
    click_on 'Week 10, 2017'

    expect(page).to have_content t('schedules.table.header_days.header',
                                   week: @schedule.biz_week)
  end
end

# Make tests easier to read
def get_date1
  Date.commercial(@schedule.biz_year, @schedule.biz_week, 1).strftime('%m/%d')
end

def get_date7
  Date.commercial(@schedule.biz_year, @schedule.biz_week, 7).strftime('%m/%d')
end
