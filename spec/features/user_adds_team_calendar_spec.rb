require 'rails_helper'
require 'google/apis/calendar_v3'

RSpec.feature 'User', type: :feature do
  include OmniAuthUser

  before do
    stub_omniauth
  end

  scenario 'can add a calendar to their account' do

    visit root_path
    click_on 'Login'

    click_on 'New Team'
    fill_in 'Name', with: 'My Awesome Team'
    click_on 'Create Team'

    expect(page).to have_link('My Awesome Team')

    click_on 'My Awesome Team'
    click_on 'Create Calendar'

    expect(page).to have_content('Calendar with 0 games was successfully created!')
  end
end

