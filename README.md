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
1. Install a really fresh Ubuntu 12.04 LTS. If you would like to use any other Linux you should be successful too but almost none of our install  
scripts will work
2. scp apphera_ubuntu.sh root@YOURSERVER.COM:/home/
3. Log into your server, and chmod +x the apphera_ubuntu.sh script and run it ./apphera_ubuntu.sh 


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

## Licensing

Apphera is distributed under a dual license: an open source license, and a commercial license. The open source license under which Apphera is distributed is the GNU Public License version 2 (GPLv2). The GPL is the world's most popular open source software license, currently used by nearly 50% of all open source software, including such software as the Linux operating system kernel, the Firefox web browser, and the MySQL relational database management system.   

For many users, the GPLv2 license suits their use of Apphera completely. These users are not distributing proprietary modifications, additions to, or derivatives of Apphera and they do not require the legal protections of a commercial license.  

For other users, the GPLv2 does not suit their use of Apphera. These users wish to use Apphera in ways, products, markets or have other requirements that are not compatible with the GPLv2. To satisfy these demands, Apphera, as the worldwide exclusive licensor of Apphera, offers commercial licensing of Apphera.  

A commercial license to Apphera provides customers the legal means both to modify Apphera and to incorporate it into a product, without the obligation of providing the resulting code under the GPLv2 license. License fees are priced competitively and offer tremendous value for the capabilities delivered. Fees vary depending on the application and the scale of its use. For more information about software licensing, please contact the Apphera Sales department.  

Apphera remains the premier open source social media monitoring and engagement project and development for both Apphera and its components follows the open source model. Apphera provides ongoing commitment and contributions to open source. Apphera's commercial licensing option provides customers with the best possible choice - the innovation and creativity of the open source model, and the protections and flexibility available with traditional, commercial software.  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request