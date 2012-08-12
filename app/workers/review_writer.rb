#!ruby19
# encoding: utf-8

require 'degermatize'

class ReviewWriter
  @queue = :bi
  @settings = SystemSetting.last
  @cp = {:google_germany => 8, :kennstdueinen => 12, :tripadvisor => 7, :bing => 6, :pointoo => 13, :qype => 10, :golocal => 14, :hotels => 15, :meinestadt => 16, :restaurantkritik => 17, :wowarstdu => 18}
  b = Bunny.new(:host => @settings.bunny_host, :user => @settings.bunny_user, :pass => @settings.bunny_password)
  b.start

  q = b.queue("pending_reviews")
  ex = b.exchange("")

  loop do
  item = JSON.parse(q.pop[:payload]) rescue nil

  if item
  reviewer_name = item["reviewer_name"]
  reviewer_url = item["reviewer_url"]
  reviewer_image_url = item["reviewer_image_url"]

  org_id = item["org_id"]
  cp = item["content_provider"]
  review_id = cp + item["id"].to_s


  review_date = item["date"]
  review_title = item["title"]
  review_description = item["description"]
  rating = item["rating"]
  review_url = item["review_url"]


  reviewer = Reviewer.find_or_create_by_slug(:name => reviewer_name, :slug => reviewer_url, :content_provider_id => @cp[cp.to_sym], :imageurl => reviewer_image_url)
  review = Review.new(:review_url => review_url,:organization_id => org_id, :content_provider_id => @cp[cp.to_sym], :review_provider_id => review_id, :reviewer_id => reviewer.id, :rating => rating.to_i, :review_date => review_date, :title => review_title,  :body => review_description)

  review.save
  end
  sleep 1
    end

end

