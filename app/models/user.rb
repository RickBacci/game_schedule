class User < ApplicationRecord
  require 'google/apis/calendar_v3'

  def self.from_omniauth(auth, role='client')
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.name             = auth.info.name
      user.token            = auth.credentials.token
      user.refresh_token    = auth.credentials.refresh_token
      user.expires_at       = Time.at(auth.credentials.expires_at).to_datetime
      user.role             = role
      user.save!
    end
  end

  def google_calendar
    calendar = Google::Apis::CalendarV3::CalendarService.new

    calendar.authorization = token
    # calendar.request_options.authorization = token
    calendar
  end
end
