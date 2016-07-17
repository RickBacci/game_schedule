FactoryGirl.define do
  factory :user do
    provider 'google_oauth2'
    uid 'uid_string'
    name 'test_dummy'
    token 'test_token'
    refresh_token 'test_refresh_token'
    expires_at Time.now().utc.iso8601
  end
end
