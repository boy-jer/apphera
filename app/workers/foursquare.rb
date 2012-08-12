#!ruby19
# encoding: utf-8

require 'foursquare2'
require 'bunny'


class Foursquare
  @queue = :foursquare
  def self.perform()
  @settings = SystemSetting.first
  b = Bunny.new(:host => @settings.bunny_host, :user => @settings.bunny_user, :pass => @settings.bunny_password)
  b.start
  @exchange = b.exchange("")
  @queue = b.queue("foursquare")
    job = JSON.parse(QUEUE.pop[:payload])  rescue nil
    if job
      p job
      @org_id = job["org_id"]
      @org = Organization.find(@org_id)
      @client = Foursquare2::Client.new(:client_id => @settings.foursquare_client_id, :client_secret => @settings.foursquare_client_secret)
      res =@client.search_venues(:ll => "#{@org.latitude.to_s},#{@org.longitude.to_s}", :query => "#{@org.name}")
      content = res.groups.first.items
      content.each do |c|
        begin
          if c.name.include? @org.name
            fs = FoursquareVenue.find_or_create_by_foursquare_id(:organization_id => @org.id, :name => c.name, :foursquare_id => c.id, :phone => c.contact.phone, :category => c.categories.first.name, :top_category => c.categories.first.parents, :address => c.location.address, :city => c.location.city, :postalcode => c.location.postalCode, :state => c.location.state, :lat => c.location.lat, :lng => c.location.lng)
            fs.save
            fc = FoursquareCount.new(:foursquare_venue_id => fs.id, :checkins_count => c.stats.checkinsCount, :users_count => c.stats.usersCount, :tip_count => c.stats.tipCount)
            fc.save
          else
            fs = FoursquareVenue.find_or_create_by_foursquare_id(:organization_id => nil, :name => c.name, :foursquare_id => c.id, :phone => c.contact.phone, :category => c.categories.first.name, :top_category => c.categories.first.parents, :address => c.location.address, :city => c.location.city, :postalcode => c.location.postalCode, :state => c.location.state, :lat => c.location.lat, :lng => c.location.lng)
            fs.save
            fc = FoursquareCount.new(:foursquare_venue_id => fs.id, :checkins_count => c.stats.checkinsCount, :users_count => c.stats.usersCount, :tip_count => c.stats.tipCount)
            fc.save
          end
        rescue
        end
      
    end
    
    end
    end

    end