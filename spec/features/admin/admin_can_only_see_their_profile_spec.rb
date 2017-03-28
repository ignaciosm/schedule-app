require 'rails_helper'

RSpec.feature 'admin can see only their profile' do
  scenario 'they are redirected when viewing another profile' do
    admin = create(:admin)
    admin2 = create(:admin, first_name: 'Joker', last_name: '?')
    sign_in admin

    visit admin_path(admin2)

    expect(page).to have_content admin.company
  end
end
