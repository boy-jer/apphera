# Apphera
## The open source Internet, social media monitoring and social engagement platform

Apphera is a complete platform, covering the full range of activities you need to cover when planning any kind of online success.

### Features

* Tracking of online reviews (Qype, Yelp, Pointoo, Hotels.com, Tripadvisor and many more)
* Local and global competitor analysis
* Twitter data mining and engagement
* Facebook
* Keyword tracking for SEO purposes
* Server monitoring for uptime and site delivery speed
* Agency and reseller tools available
* Mapping of competitive landscape
* Influencer identification 
* Tracking of Foursquare activity
* Youtube tracking

## Installation

1. Clone the project    
`git clone https://github.com/nikoma/apphera.git`  
2. Install Elasticsearch and start up a local instance like    
`elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.17.7/config/elasticsearch.yml`  
3. switch to the apphera folder on your harddrive  
`cd apphera`  
4. Run the init script.  
`./apphera_setup`  
In case it is not executable for you please enter:  
`chmod +x apphera_setup.sh`  
and try again to issue `./apphera_setup`

The installer expects the database to be on the same server as we tried to make the application as lean as possible. It would normally be installed on at least 5 servers.  

If you don't want to run the automated init scripts or want to use a different database you can do the following:  

1. edit config/database.yml to set your database. PLEASE DO NOT REUSE EXISTING DATABASE NAMES AS THE INIT SCRIPT WILL WIPE IT OUT. 
then issue:  
`rake db:create`  
`rake db:schema:load`  
`rake db:seed`  

Now you should be able to start the application on the command line via:  
`rail s`

Over the next days we will add missing crawler modules etc. which we are preparing now.  Parts of the methods work by connecting to our API right now which happens transparent without any intervention, signup or other actions by you. Stay tuned for more over the next few days!


  



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request