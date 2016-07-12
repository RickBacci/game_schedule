require 'rails_helper'


RSpec.feature 'User creates a team', type: :feature do

  scenario 'with valid name' do
    visit root_path

    click_on 'New Team'
    fill_in 'Name', with: 'My Team'
    click_on 'Create Team'

    expect(page).to have_content('Team successfully created!')
  end

  scenario 'with an invalid name' do
    visit root_path

    click_on 'New Team'
    fill_in 'Name', with: ''
    click_on 'Create Team'

    expect(page).to have_content('Team name cannot be blank!')
  end

end
