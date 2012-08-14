module Meinestadt
  def scrape url
    page = get url
    company = {}
    company['name'] = page.at('h1.colorhead').text rescue nil
    company['phone'] = page.at('span.voice').text
    company['url'] = page.at('div.vcard a[title]')[:href]
    company['street'] = page.at('span.street-address').text.strip
    company['zip'] = page.at('span.postal-code').text
    company['city'] = page.at('span.locality').text.strip
    @job.save_company company
    
    page.search('div.review_item').each do |div|
      item = {}
      item[:date] = Date.parse div.at('div.review_date span')[:title]
      item[:description] = div.at('div.review_body_text').text.strip
      item[:id] = div.to_s[/review_id=(\d+)/, 1]
      item[:reviewer_name] = div.at('span.user_name').text
      item[:rating] = div.at('div.main_mark_stars span')[:title]
      @job.save item
    end
  end
end

if __FILE__ == $0
  require 'pry'
  require_relative '../../scraper'
  job = Job.new('{"content_provider":"meinestadt", "module_type":"review", "url":"http://branchenbuch.meinestadt.de/hamburg/company/3340663"}')
  Scraper.new(job).run
end
