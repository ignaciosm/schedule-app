require 'rails_helper'

RSpec.feature 'Admin can sign in' do
  scenario 'then they see their admin page' do
    admin = create(:admin)
    sign_in admin

    expect(page).to have_content t('admin.show.greeting')
  end
end
