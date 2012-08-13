require 'httparty'

class AppheraApi
  include HTTParty
  
  def self.get_proxy
    auth = {:username => "apphera", :password => "supersecure"}
    options = {:basic_auth => auth}
    base_uri = 'http://127.0.0.1:3000/ProxiesApi'
    response = HTTParty.get(base_uri, options)
    response.body
  end

  def self.disable_proxy options
    auth = {:username => "apphera", :password => "supersecure"}
    options.merge!({:basic_auth => auth})
    base_uri = 'http://127.0.0.1:3000/ProxiesApi_Disable'
    response = HTTParty.get(base_uri, options)
  end
end