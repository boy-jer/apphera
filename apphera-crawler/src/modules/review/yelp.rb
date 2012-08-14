module Yelp
  def scrape url
    @agent.request_headers = {"accept-language" => "de-de"}
    page = get(url).parser
    company = {}
    company['name'] = page.at('h1.org').text.strip
    company['street'] = page.at('span.street-address').text
    company['zip'] = page.at('span.postal-code').text[/\d{4,}/]
    company['city'] = page.at('span.locality').text.strip
    company['phone'] = page.at('span.tel').text
    company['url'] = URI.decode page.at('div#bizUrl a')[:href][/url=([^&]+)/, 1]
    @job.save_company company

    page.search('li.review').each do |li|
      item = {}
      item[:id] = li[:id].gsub(/^review_/, '')
      item[:title] = '' # no title
      item[:rating] = li.at('div.rating span.value-title')[:title]
      item[:description] = li.at('p.description').text
      item[:date] = Date.new($3.to_i, $1.to_i, $2.to_i) if li.at('em.dtreviewed').text =~ /(\d+)\.(\d+)\.(\d{4})/ rescue
      item[:reviewer_name] = li.at('li.user-name').text.strip
      item[:reviewer_url] = URI.join(url, li.at('div.photo-box a')[:href]).to_s rescue nil
      item[:reviewer_image_url] = URI.join(url, li.at('div.photo-box a img')[:src]).to_s rescue nil
      @job.save item
    end
  end
end

# this part helps me test it, it only gets run when we're testing.
# we can comment it out once we're done testing
if __FILE__ == $0
  # gem 'mechanize', '=1.0.0'
  require 'pry'
  require_relative '../../scraper'
  job = Job.new('{"content_provider":"yelp", "module_type":"review", "url":"http://www.yelp.de/biz/shin-shin-hamburg"}')
  Scraper.new(job).run
end
