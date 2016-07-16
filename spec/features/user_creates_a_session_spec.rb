require 'rails_helper'

RSpec.feature 'User', type: :feature do
  include OmniAuthUser

  before do
    stub_omniauth
  end

  scenario 'can create and destroy a session' do

    VCR.use_cassette("user_create_and_destroy_session") do
      visit root_path

      click_on 'Login'

      expect(page).to have_link('Logout')

      click_on 'Logout'

      expect(page).to have_link('Login')
    end
  end
end
