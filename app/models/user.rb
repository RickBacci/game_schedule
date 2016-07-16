class User < ApplicationRecord
  require 'net/http'
  require 'json'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider       = auth.provider
      user.uid            = auth.uid
      user.name           = auth.info.name
      user.token          = auth.credentials.token
      user.refresh_token  = auth.credentials.refresh_token
      user.expires_at     = Time.at(auth.credentials.expires_at).to_datetime
      user.save!
    end
  end

  def to_params
    {
      refresh_token: refresh_token,
      client_id:     ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      grant_type:    'refresh_token'
    }
  end

  def request_token_from_google
    url = URI("https://www.googleapis.com/oauth2/v3/token")
    Net::HTTP.post_form(url, self.to_params)
  end

  def refresh!
    response = request_token_from_google
    data     = JSON.parse(response.body)

    update_attributes(
      token: data['access_token'],
      expires_at: calculate_token_expiration_time(data))
  end

  def expired?
    expires_at <= Time.now
  end

  def fresh_token
    refresh! if expired?
    token
  end

  def google_calendar
    calendar = Google::Apis::CalendarV3::CalendarService.new

    calendar.authorization = self.fresh_token
    calendar
  end


  private

  def calculate_token_expiration_time(data)
    Time.now + (data['expires_in'].to_i).seconds
  end
end
