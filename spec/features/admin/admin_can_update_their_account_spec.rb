require 'rails_helper'

RSpec.feature 'admin can update their account' do
  scenario 'then they see their updated information' do
    admin = create(:admin)
    sign_in admin
    new_company = 'Batman Inc'
    password = 'demoPass1@'

    visit admin_path(admin)
    click_on t('admins.show.update_account')
    fill_in 'admin_company', with: new_company
    fill_in 'admin_current_password', with: password
    click_on 'Update'

    expect(page).to have_content new_company
  end
end
