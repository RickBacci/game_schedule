# Dynamic Game Schedule


* Ruby version -- 2.3.1
* Rails version -- 5.0.0

* Configuration
  - git clone git@github.com:RickBacci/game_schedule.git
  - bundle install
  
  - visit https://console.developers.google.com to configure your API
  - bundle exec figaro install
  
  - In your config/application.yml file add:
  - GOOGLE_CLIENT_ID: 'your client id'
  - GOOGLE_CLIENT_SECRET: 'your client secret'
  - provider: google_oauth2
  - uid: 'your uid'
  - token: 'your token'
  - refresh_token: 'your refresh token'
  - expires_at: 'expires at'

The client id, secret, and provider are used for authentication,
the rest for testing.

* Database 
  - rake db:create db:migrate
  - rake db:seed to use the included seed file

* Testing
  - bundle exec rspec

* Heroku deployment instructions
  - figaro heroku:set -e production
