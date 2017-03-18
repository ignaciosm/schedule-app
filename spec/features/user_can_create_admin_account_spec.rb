require 'rails_helper'

RSpec.feature 'user can create admin account' do
  scenario 'then they see their account page' do
    admin_email = 'batman@example.com'
    admin_password = 'demoPass1@'
    admin_first_name = 'Bruce'
    admin_last_name = 'Wayne'
    admin_company = 'Wayne Enterprises'

    visit new_admin_registration_path
    fill_in 'admin_email', with: admin_email
    fill_in 'admin_password', with: admin_password
    fill_in 'admin_password_confirmation', with: admin_password
    fill_in 'admin_first_name', with: admin_first_name
    fill_in 'admin_last_name', with: admin_last_name
    fill_in 'admin_company', with: admin_company
    click_on 'Sign up'

    expect(page).to have_content admin_first_name
  end
end
