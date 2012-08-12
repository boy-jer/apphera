class SystemSetting < ActiveRecord::Base
  attr_accessible :bing_api_key, :bunny_host, :bunny_password, :bunny_user, :facebook_api_key, :facebook_api_secret, :google_api_key, :twitter_consumer_key, :twitter_consumer_secret, :twitter_oauth_token, :twitter_oauth_token_secret,
  :foursquare_client_id, :foursquare_client_secret
end
