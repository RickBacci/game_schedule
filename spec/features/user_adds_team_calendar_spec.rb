require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'can add a calendar to their account' do
    visit root_path

    click_on 'New Team'
    fill_in 'Name', with: 'My Awesome Team'
    click_on 'Create Team'

    expect(page).to have_link('My Awesome Team')

    click_on 'My Awesome Team'
    click_on 'Create Calendar'

    expect(page).to have_content('Calendar successfully created!')

  end
end

