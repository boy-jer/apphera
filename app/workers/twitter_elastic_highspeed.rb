# encoding: utf-8
require 'rubygems'
require 'tweetstream'
require 'yajl'

require 'rest-client'


class TwitterElasticHighspeed
  @queue = :twitter


  def self.perform()
    @settings = SystemSetting.last

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
      config.parser = :yajl
    end
    # The TwitterKeyword key queue keeps all keywords which will be tracked via twitter and written to RabbitMQ as ever slowdown might cause the Twitter
    # Gardenhose to just cut you off as too slow consumer. In larger environments we throw at Elastic but it has hickups every once in a while which cuts of
    # the Twitter stream..

    keys = TwitterKeyword.all.map { |o| o.name }


    TweetStream::Client.new.track(keys) do |status|
    RestClient.post 'http://127.0.0.1:9200/twitter/tweet', status.to_json, :content_type => :json, :accept => :json
    end
    

  end
end
