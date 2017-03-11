require 'rails_helper'

RSpec.feature 'Admin can sign in' do
  scenario 'they see their admin page' do
    admin = create(:admin)

    visit new_admin_session_path
    fill_in 'admin_email', with: admin.email
    fill_in 'admin_password', with: admin.password
    click_on 'Log in'

    expect(page).to have_content t('admin.show.greeting')
  end
end
