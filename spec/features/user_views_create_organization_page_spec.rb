require 'rails_helper'

RSpec.describe 'User views create organization page' do
  scenario 'they see form for creating organzation' do
    visit new_organization_path

    expect(page).to have_tag('form')
  end
end
