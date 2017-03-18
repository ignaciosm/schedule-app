require 'rails_helper'

RSpec.feature 'admin can update their account' do
  scenario 'then they see their updated information' do
    admin = create(:admin)
    sign_in admin
    new_company = 'Batman Inc'

    visit admin_path(admin)
    click_on t('admin.show.update_account')
    fill_in 'admin_company', with: new_company
    click_on 'Update Account'

    expect(page).to have_content new_company
  end
end
