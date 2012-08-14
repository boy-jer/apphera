require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'http://rubygems.org'
gem 'rails', '3.2.7'
group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', '>= 1.0.3'
  gem 'less'
end
gem 'therubyracer', :platform => :ruby
gem 'twitter-bootstrap-rails'
gem 'activeadmin'
gem 'jquery-rails'
#if HOST_OS =~ /linux/i
#gem 'therubyracer', '>= 0.10.1'
#end
gem "bullet", :group => "development"
gem "rspec-rails", ">= 2.8.0.rc1", :group => [:development, :test]
gem "factory_girl_rails", ">= 1.4.0", :group => :test
gem "cucumber-rails", ">= 1.2.0", :group => :test
gem "capybara", ">= 1.1.2", :group => :test
gem "database_cleaner", ">= 0.7.0", :group => :test
gem "launchy", ">= 2.0.5", :group => :test
gem "guard", ">= 0.6.2", :group => :development
# case HOST_OS
#   when /darwin/i
   gem 'rb-fsevent', :group => :development
     gem 'growl', :group => :development
#   # when /linux/i
#   #    gem 'libnotify', :group => :development
#   #    gem 'rb-inotify', :group => :development
#   when /mswin|windows/i
#     gem 'rb-fchange', :group => :development
#     gem 'win32console', :group => :development
#     gem 'rb-notifu', :group => :development
# end
gem "guard-bundler", ">= 0.1.3", :group => :development
gem "guard-rails", ">= 0.0.3", :group => :development
gem "guard-livereload", ">= 0.3.0", :group => :development
gem "guard-rspec", ">= 0.4.3", :group => :development
gem "guard-cucumber", ">= 0.6.1", :group => :development
gem "devise", "= 1.5.3"
gem "mysql2"
gem 'uuid'
gem 'lazy_high_charts'
gem "cucumber-rails-training-wheels", :group => :test
gem 'pickle', :group => :test
gem "inherited_resources"
gem 'yajl-ruby'
gem 'activerecord-import'
gem 'unicorn'
gem 'formtastic', '~> 2.1.0'
gem 'simple_form'
gem 'kendoui-rails'
gem 'bunny'
gem 'randumb'
gem 'gmaps4rails'
gem 'tire'
gem 'kaminari'
gem 'paper_trail', '~> 2'
gem 'dalli'
#gem "aws-ses", "~> 0.4.4", :require => 'aws/ses'
gem 'awesome_print', :group => :development
gem 'methodfinder', :group => :development
gem 'geocoder'
gem 'social_media_monitoring'
gem 'tweetstream'
gem 'resque', :require => "resque/server"
gem 'resque-scheduler', :require => 'resque_scheduler'
gem 'foursquare2'
gem 'degermatize'
gem 'twilio-ruby'


