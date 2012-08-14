require 'bunny'

class Queue
  class EmptyQueue < RuntimeError; end

  b = Bunny.new(:host => "eu.apphera.com", :user => 'guest', :pass => 'guest')
  b.start

  QUEUES = {'review' => 'pending_reviews', 'competitor' => 'pending_competitors'}
  CRAWLERS = b.queue("crawlers")
  EXCHANGE = b.exchange('')

  def self.disable_proxy options
    EXCHANGE.publish(options.to_json, key: 'bad_proxies')
  end

end