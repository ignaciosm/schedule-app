require 'rails_helper'

RSpec.describe 'admins/show.html.erb' do
  context 'shows the employees by position' do
    it 'has a shift lead section' do
      admin = build(:admin)
      assign(:admin, admin)

      render

      expect(rendered).to have_content t('admins.show.shift_lead_label')
    end

    it 'has a team member section' do
      admin = build(:admin)
      assign(:admin, admin)

      render

      expect(rendered).to have_content t('admins.show.team_member_label')
    end
  end
end
