class Proxy
  attr_accessor :host, :port, :proxy_id

  def initialize
    json = JSON.parse(AppheraApi.get_proxy)
    @host, @port, @proxy_id = json['ip'], json['port'].to_i, json['proxy_id']
  end

  def disable options = {}
    #AppheraApi.disable_proxy options.merge({:proxy_id => @proxy_id})
    Queue::disable_proxy options
  end
end
