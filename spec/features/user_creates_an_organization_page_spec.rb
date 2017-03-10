require 'rails_helper'

RSpec.describe 'User creates an organization' do
  scenario 'they see the page for the created organization' do
    org_name = 'Nekter Juice Bar'
    org_email = 'njb@example.com'
    org_organizer = 'Jane Doe'
    org_password = 'password'
    org_password_confirmation = 'password'

    visit root_path
    click_on 'Create an organization'
    fill_in 'organization_name', with: org_name
    fill_in 'organization_email', with: org_email
    fill_in 'organization_organizer', with: org_organizer
    fill_in 'organization_password', with: org_password
    fill_in 'organization_password_confirmation', with: org_password_confirmation
    click_on 'Create Organization'

    expect(page).to have_content(org_name)
  end
end
