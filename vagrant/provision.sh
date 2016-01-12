#!/usr/bin/env bash

# prevents 'dpkg-reconfigure: unable to re-open stdin' error
export DEBIAN_FRONTEND=noninteractive

# update
echo "Updating Package List..."
apt-get update -yqq

# so I like fish a lot
echo "Installing fish..."
apt-get install -yqq fish
echo `which fish` >> /etc/shells
usermod -s `which fish` vagrant

# general additional software
echo "Installing additional packages..."
apt-get install -yqq $(grep -vE "^\s*#" /vagrant/vagrant/packages.txt)

# python stuff
echo "Installing Python packages..."
apt-get install -yqq python-dev python-virtualenv python-pip
sudo -H -u vagrant fish -c 'virtualenv ~/vagrantvirtualenv'
sudo -H -u vagrant fish -c '. ~/vagrantvirtualenv/bin/activate.fish'
sudo -H -u vagrant fish -c 'echo . ~/vagrantvirtualenv/bin/activate.fish > ~/.config/fish/config.fish'

sudo -H -u vagrant fish -c 'pip install pip --upgrade'
sudo -H -u vagrant fish -c 'pip install -r /vagrant/requirements.txt'
