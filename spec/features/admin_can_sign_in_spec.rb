require 'rails_helper'

RSpec.feature 'Admin can sign in' do
  scenario 'they see their admin page' do
    admin_email = 'demo@example.com'
    admin_password = 'demoPass1'

    visit new_admin_session_path
    fill_in 'admin_email', with: admin_email
    fill_in 'admin_password', with: admin_password
    click_on 'Log In'

    expect(page).to have_content t('admin.show.greeting')
  end
end
