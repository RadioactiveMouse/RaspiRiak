#!/bin/bash

# Update system
echo "Making sure system is up to date"
sudo apt-get -y update
sudo apt-get -y dist-upgrade

# Install dependencies
sudo apt-get install -y erlang git

# Clone latest stabl release of riak via https
echo "Cloning Riak"
git clone -b riak-1.3.2 https://github.com/basho/riak.git

# Make the target
echo "Installing Riak"
cd riak/
time sudo make rel
cd ..

# append riak to the .bashrc
echo "Updating bashrc to make it easier to run Riak. Backup stored as .oldbashrc"
cp $HOME/.bashrc $HOME/.oldbashrc
echo "export PATH=$PATH:$HOME/riak/rel/riak/bin" >> $HOME/.bashrc

# start riak
echo "Starting Riak"
sudo ./riak/rel/riak/bin/riak start

# check to see if riak is up
echo "Pinging Riak"
echo "Status is : "
curl http://localhost:8098/ping

echo "If the line above says OK then the Riak has been installed successfully and is running."
