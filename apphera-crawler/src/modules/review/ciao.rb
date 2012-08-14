module Ciao

  def do_page page
    page.search('td.teaser').map{|td| td.parent}.each do |div|
      item = {}
      item[:rating] = div.at('img.ratingStars')[:class][/\d/]
      # item[:reviewer_image_url] = 
      raise 'bad date' unless div.at('td.usefulness').text =~ /(\d{2})\.(\d{2})\.(\d{4})/
      item[:date] = Date.new *[$3,$2,$1].map(&:to_i)

      item[:reviewer_name] = div.at('./td/span[@class="sub"][2]').text.strip
      item[:reviewer_url] = #URI.join(@job.url, div.at('div.header a')[:href]).to_s
      item[:id] = div.at('td.teaser > a')[:href][/\d+/] rescue nil

      item[:title] =  div.at('td.teaser > a').text rescue nil
      item[:title] ||=  div.at('span').text

      p = div.search('.//p[@class="text"]').last
      more = p.at('a').remove rescue nil
      item[:description] = p.text.strip

      if more# && item[:description] =~ /...$/
        # get expanded description
        url = URI.join(@job.url, more[:href]).to_s
        review = get url
        item[:description] = review.at('div#intelliTXT').text.strip
      end

     p item # @job.save item
    end
  end

  def scrape url
    @agent.set_proxy 'localhost', 8888
    page = get url
    puts page.header['server']
    # case page.header['server']
    #   when 'Ciao HTTPD Server' then ...
    #   when 'Microsoft-IIS/7.5' then ...
    # end
    company = {}
    company['name'] = page.at('h1 a').text.strip
    binding.pry
    # company['phone'] = 
    # company['street'] = 
    # company['zip'] = 
    # company['city'] = 
    # company['url'] = 
    @job.save_company company
    p page #do_page page

    next_link = page.at('//a[contains(.,"chste Seite")]')
    while next_link
      next_url = URI.join(@job.url, next_link[:href]).to_s
      page = get next_url
      do_page page
      next_link = page.at('//a[contains(.,"chste Seite")]')
    end
  end

  def valid? url
    url =~ /^http:\/\/reisen.ciao.de/i
  end
end


#If mechanize fails the result is written in error queue.

if __FILE__ == $0
  require 'pry'
  require_relative '../../scraper'
  job = Job.new('{"content_provider":"ciao", "module_type":"review", "url":"http://reisen.ciao.de/Erfahrungsberichte/Schweinske_Hamburg__402812"}')
  Scraper.new(job).run
end
