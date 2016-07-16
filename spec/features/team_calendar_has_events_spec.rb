require 'rails_helper'
require 'google/apis/calendar_v3'

RSpec.feature 'User', type: :feature do
  include OmniAuthUser

  before do
    stub_omniauth
  end

  scenario 'can add events to the calendar' do
    visit root_path
    click_on 'Login'

    click_on 'New Team'
    fill_in 'Name', with: 'My Awesome Team'
    click_on 'Create Team'

    click_on 'My Awesome Team'
    click_on 'Add Game'

    fill_in 'Date', with: '31/07/2016'
    fill_in 'Time', with: '05:30PM'
    fill_in 'Field', with: 'Lombardo'

    click_on 'Create Game'

    click_on 'Create Calendar'

    expect(page).to have_content('Calendar with 1 game was successfully created!')

  end
end

