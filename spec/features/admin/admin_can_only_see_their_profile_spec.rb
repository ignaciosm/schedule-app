require 'rails_helper'

RSpec.feature 'admin can see only their profile' do
  scenario 'they are redirected when viewing another profile' do
    admin1  = create(:admin)
    admin2  = create(:admin, company: 'Joker and Sons')
    sign_in admin1

    visit admin_path(admin2)

    expect(page).to     have_content admin1.company
    expect(page).to_not have_content admin2.company
  end
end
