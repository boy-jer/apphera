#!ruby19
# encoding: utf-8

# TODO: credentials
class ProxyList
  @queue = :bi
    @settings = SystemSetting.last
    theList = Net::HTTP.get_response(URI.parse("http://www.thebigproxylist.com/members/proxy-api.php?user=1108&pass=#{@settings.best_proxy_password}"))
    aFile = File.new("proxyfile.txt", "wb")
    aFile.write(theList.body)
    aFile.close
    File.open('proxyfile.txt', 'r') do |f1|
      while line = f1.gets
        line.scan(/:/) { |match|
          p $`
          ip = $`
          port = $'
          port = port.gsub("\n", "")
          begin
          Proxy.create!(:ip => ip.to_s, :port => port.to_s, :tested => true, :bad => false)
          rescue => e
            p e.inspect
            end}
    end
  
  end
end