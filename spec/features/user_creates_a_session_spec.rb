require 'rails_helper'

RSpec.feature 'User', type: :feature do
  include OmniAuthUser

  before do
    stub_omniauth
  end

  scenario 'can create and destroy a session' do
    visit root_path

    click_on 'Login'

    expect(page).to have_link('Logout')

    click_on 'Logout'

    expect(page).to have_link('Login')
  end

end
