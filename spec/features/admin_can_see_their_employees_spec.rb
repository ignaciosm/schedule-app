require 'rails_helper'

RSpec.feature 'Admins can see their employees' do
  scenario 'from their account page' do
    admin = create(:admin)
    employee = create(:employee)
    sign_in admin

    expect(page).to have_content employee.first_name
  end
end
