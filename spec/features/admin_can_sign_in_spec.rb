require 'rails_helper'

RSpec.feature 'Admin can sign in' do
  scenario 'they see their admin page' do
    admin = create(:admin)
    admin_email = admin.email
    admin_password = admin.password

    visit root_path
    click_on 'Sign in'
    fill_in 'admin_email', with: admin_email
    fill_in 'admin_password', with: admin_password
    click_on 'Log In'

    expect(page).to have_content t('admin.show.greeting')
  end
end
