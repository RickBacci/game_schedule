require 'rails_helper'

RSpec.feature 'Team adds a game', type: :feature do

  scenario 'with valid attributes' do
    visit root_path

    click_on 'New Team'
    fill_in 'Name', with: 'My Team'
    click_on 'Create Team'

    click_on 'My Team'
    click_on 'Add Game'

    fill_in 'Date', with: '31/07/2016'
    fill_in 'Time', with: '05:30PM'
    fill_in 'Field', with: 'Lombardo'

    click_on 'Create Game'

    expect(page).to have_content('31/07/2016')
    expect(page).to have_content('05:30PM')
    expect(page).to have_content('Lombardo')
  end

  xscenario 'with invalid attributes' do
    visit root_path

    click_on 'New Team'
    fill_in 'Name', with: 'My Team'
    click_on 'Create Team'

    click_on 'My Team'
    click_on 'Add Game'

    fill_in 'Date', with: ''
    fill_in 'Time', with: '05:30PM'
    fill_in 'Field', with: 'Lombardo'

    click_on 'Create Game'

    expect(page).to have_content('Date cannot be blank!')

    fill_in 'Date', with: '31/07/2016'
    fill_in 'Time', with: ''
    fill_in 'Field', with: 'Lombardo'

    click_on 'Create Game'

    expect(page).to have_content('Time cannot be blank!')

    fill_in 'Date', with: '31/07/2016'
    fill_in 'Time', with: '05:30PM'
    fill_in 'Field', with: ''

    click_on 'Create Game'

    expect(page).to have_content('Field cannot be blank!')
  end

end
