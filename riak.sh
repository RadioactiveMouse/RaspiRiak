#!/bin/bash

# Update system
echo "Making sure system is up to date"
sudo apt-get -y update
sudo apt-get -y dist-upgrade

# Install dependencies
sudo apt-get install -y erlang git curl

# Clone latest stable release of riak via https
echo "Cloning 1.4.0 Riak"
git clone -b 1.4 https://github.com/basho/riak.git

# Make the target
echo "Installing Riak"
cd riak/
time sudo make rel
cd ..

# append riak to the .bashrc
echo "Updating .profile to make it easier to run Riak. Backup stored as .oldprofile"
cp $HOME/.profile $HOME/.oldprofile
echo "export PATH=$PATH:$HOME/riak/rel/riak/bin" >> $HOME/.profile
source ~/.profile

# start riak
echo "Starting Riak"
sudo riak start

# check to see if riak is up
echo "Pinging Riak"
# Give the riak node time to start up
sleep 5
echo "Status is : "
curl http://127.0.0.1:8098/ping

echo "If the line above says OK then the Riak has been installed successfully and is running."
