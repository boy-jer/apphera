#!ruby19
# encoding: utf-8
require 'uri'
require 'net/http'
require 'open-uri'
require 'bunny'
require 'httparty'
require 'json'

class BingApi
  @queue = :search
  include HTTParty
  # TODO: credentials and or using apphera API
  def search(query)
    @settings = SystemSetting.last
    query_encoded = URI.escape(query)   
    auth = {:username => "", :password => @settings.bing_api_key}
    options = {:basic_auth => auth}
    base_uri = "https://api.datamarket.azure.com/Data.ashx/Bing/Search/Web?Query=%27#{query_encoded.to_s}%27&Market=%27de-DE%27&$top=50&$format=Json"
    puts base_uri
    response = HTTParty.get(base_uri, options)
    response.body
  end
end


def self.perform()
  @settings = SystemSetting.last
  b = Bunny.new(:host => @settings.bunny_host, :user => @settings.bunny_user, :pass => @settings.bunny_password)
  b.start
  q = b.queue("bing_links")
  ex = b.exchange("")
  
   job = JSON.parse(QUEUE.pop[:payload]) rescue nil
   if job
     org_id = job["org_id"].to_i
     @org = Organization.find_by_id(org_id)
     @org_id = @org.id
     @keyword = "#{@org.name}, #{@org.street}, #{@org.city}"
     answer =  JSON.parse(BingApi.new.search @keyword)  
     a=  0
     answer['d']['results'].each do |r|
       
       begin
       OrganizationLink.create!(:organization_id => @org_id, url: r['Url'], bing_id: r['ID'], bing_display_url: r['DisplayUrl'], description: r['Description'], title: r['Title'])
       rescue
         p "links exist"
         end

       end
   end
end




 
 
