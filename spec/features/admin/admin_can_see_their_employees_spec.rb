require 'rails_helper'

RSpec.feature 'Admins can see their employees' do
  scenario 'from their account page' do
    admin = create(:admin)
    sign_in admin
    create(:employee, admin: admin,
                      first_name: 'Boaty',
                      last_name:  'McBoatface')

    visit admin_path(admin)

    expect(page).to have_content('Boaty M.')
  end
end
