require 'factory_girl'

Factory.define :user do |u|
  u.email 'niko.manek@gmail.com'
  u.password 'hallo123'
end

Factory.define :keyword do |u|
  u.name 'Test keyword'
end

Factory.define :reviewer do |u|
  u.name "peter"
  u.slug "8q75n8qn7ciqnwqcy"
end
Factory.define :review do |u|
  u.reviewer 'reviewer name'
  u.body '8q75n8qn7ciqnwqcy'
  u.reviewer_id  5
  u.rating  4
  u.content_provider_id  10
  
end

Factory.define :account do |u|
  u.name "Test"
end

Factory.define :organization do |u|
  u.name "Test"
end
