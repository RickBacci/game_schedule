module OmniAuthUser

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google_oauth2] = nil

    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      {
        provider:   ENV['provider'],
        uid:        ENV['uid'],
          info: {
          name:     'test_name',
        },
        credentials: {
          token:         ENV['token'],
          refresh_token: ENV['refresh_token'],
          expires_at:    ENV['expires_at'].to_i,
          expires:       true
        }
      })
  end

end
