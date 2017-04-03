require 'rails_helper'

RSpec.feature 'admin can see only their profile' do
  scenario 'they are redirected when viewing another profile' do
    admin1  = create(:admin, company: 'Wayne Enterprises')
    admin2  = create(:admin, company: 'Joker and Sons')
    sign_in admin1

    visit admin_path(admin2)

    expect(page).to     have_content('Wayne Enterprises')
    expect(page).to_not have_content('Joker and Sons')
  end
end
