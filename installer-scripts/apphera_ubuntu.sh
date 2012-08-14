#!/bin/bash
echo "Beginning with Apphera Community edition 1.0. installation. DIAGNOSTICS"
echo "------------------"
echo "Memory information"
free -m
echo "Disk information"
df -h
echo "System rescources seem sufficient for Apphera system - Congratulations"
echo "END DIAGNOSICS"
sleep 2
echo "------------------"
echo "Making sure system is up to date"
sudo apt-get update
sudo apt-get -y upgrade
echo "System up to date"
echo "------------------"
echo "adding debian repo"
sleep 1


sudo service rabbitmq restart
echo "we will now add a user deployer - please answer a couple simple questions about it"
sudo adduser deployer
echo "Horray! Done!"
echo "let's install the newest stable MySQL server as core DB for Apphera"
sudo apt-get -y install mysql-server
echo "done!"
echo "------------------"
echo "Lets install GIT as we use that to pull the newest version from github"
sudo apt-get -y install git
sudo chown -R deployer:deployer /home/deployer/
cd /home/deployer 

git clone https://github.com/nikoma/apphera.git
echo "everything there"
echo "Installing Ruby now:"
sudo apt-get -y install ruby1.9.1 ruby1.9.1-dev \
  rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 \
  build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev

sudo update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 400 \
         --slave   /usr/share/man/man1/ruby.1.gz ruby.1.gz \
                        /usr/share/man/man1/ruby1.9.1.1.gz \
        --slave   /usr/bin/ri ri /usr/bin/ri1.9.1 \
        --slave   /usr/bin/irb irb /usr/bin/irb1.9.1 \
        --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.1
 
sudo update-alternatives --config ruby
sudo update-alternatives --config gem

echo "and the Ruby version is:"
ruby --version
echo "congratulations!"
echo "Now redis server to get Resque message queue to work"
sudo apt-get -y install redis-server
echo "Installing bundler now to get all the gems/modules for Apphera system"
cd /home/deployer/apphera

echo "some more libraries first to use MySQL"
sudo apt-get -y install libxml2-dev 
sudo apt-get -y install libxslt-dev
sudo apt-get -y install libmysqlclient-dev
sudo gem install bundler
cd /home/deployer/apphera
echo "Done!"
echo "--------------------"
cd /home/deployer/apphera
echo "This might take a while - Installing search cluster - Get a coffee"
bundle install
echo "done!"
echo "--------------------"
echo "Now the final touches"
cd /home/deployer/apphera
echo "Let's kick up a background worker!"
cd /home/deployer/apphera
echo "Congratulations! Your Apphera System should be up and running. Restarting everything just to be sure. Then we will start on the development port 3000"
echo "You can then check out:"
echo "RabbitMQ - http://127.0.0.1::55672/mgmt/"
echo "Resque without username and password apphera - http://127.0.0.1:3000/resque"
echo "Apphera dashboard http://127.0.0.1:3000"
echo "just wait a couple seconds and the website should be up as well. To complete installations we then need to use a real web server..."


# QUEUE=* rake resque:work &

# edit /etc/apt/sources.list and add at the end:  deb http://www.rabbitmq.com/debian/ testing 
# sudo wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
# sudo apt-key add rabbitmq-signing-key-public.asc
# apt-get update
# sudo apt-get install rabbitmq-server
# sudo rabbitmq-plugins enable rabbitmq_management
# chmod +x apphera_elastic.sh
# ./apphera_elastic.sh
# chmod +x apphera_setup.sh
# ./apphera_setup.sh
# echo "Done: Username is by the way guest/guest, you should change that or firewall your server - Well, anyways a good idea!"
# echo "starting message queue"
# echo "------------------"




