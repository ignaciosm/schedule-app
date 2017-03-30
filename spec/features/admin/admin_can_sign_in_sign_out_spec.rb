require 'rails_helper'

RSpec.feature 'Admin can sign in' do
  scenario 'then they see their admin page' do
    admin = create(:admin)
    sign_in admin

    visit new_admin_session_path

    expect(page).to have_content t('admins.show.greeting',
                                   company: admin.company)
  end
end

RSpec.feature 'Admin can sign out' do
  scenario 'they are redirect to the root path' do
    admin = create(:admin)
    sign_in admin

    visit admin_path(admin)
    click_on 'Sign out'

    expect(page).to have_content 'Signed out successfully.'
  end
end
