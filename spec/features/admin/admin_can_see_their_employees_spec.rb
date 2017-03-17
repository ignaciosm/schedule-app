require 'rails_helper'

RSpec.feature 'Admins can see their employees' do
  scenario 'from their account page' do
    admin = create(:admin)
    sign_in admin
    employee = create(:employee, admin: admin)

    visit admin_path(admin)

    expect(page).to have_content employee.first_name_last_initial
  end
end