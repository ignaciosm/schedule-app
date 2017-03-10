require 'rails_helper'

RSpec.feature 'User views homepage:' do
  scenario 'they see "Hello World"' do
    visit root_path

    expect(page).to have_content t('welcome.home.greeting')
  end
end
