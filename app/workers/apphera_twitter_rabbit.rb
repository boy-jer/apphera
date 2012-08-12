# encoding: utf-8
require 'rubygems'
require 'tweetstream'
require 'yajl/json_gem'
require 'bunny'
require 'rest-client'

class AppheraTwitterRabbit
  @queue = :twitter

@settings = SystemSetting.first
  
  def self.perform()
p Category.first.name  

b = Bunny.new(:host => @settings.bunny_host, :user => @settings.bunny_user, :pass => @settings.bunny_password)
b.start
q = b.queue("tweets")
ex = b.exchange("")

   

   TweetStream.configure do |config|
      config.consumer_key = @settings.twitter_consumer_key
      config.consumer_secret = @settings.twitter_consumer_secret 
      config.oauth_token = @settings.twitter_oauth_token 
      config.oauth_token_secret = @settings.twitter_oauth_token_secret 
      config.auth_method = :oauth
      config.parser   = :yajl
     end
  keys = TwitterKeyword.all.map {|o| o.name}

 TweetStream::Client.new.track(keys) do |status|
   ex.publish(status.inspect.to_json, :key => "tweets") 
 end
end
end
