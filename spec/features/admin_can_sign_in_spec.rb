require 'rails_helper'

RSpec.feature 'Admin can sign in' do
  scenario 'then they see their admin page' do
    admin = create(:admin)
    sign_in admin

    visit new_admin_session_path

    expect(page).to have_content t('admins.show.greeting', email: admin.email)
  end
end
