#!/usr/bin/env bash

set -e

if type "apt-get" > /dev/null; then
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get -y install git ruby ruby-dev build-essential \
        libdumbnet-dev libpcap-dev libgeoip-dev libffi-dev python-dev python-pip python-virtualenv libssl-dev
fi

if type "yum" > /dev/null; then
    sudo yum groupinstall 'Development Tools'
    sudo yum install pcap-devel dnet-devel geoip-devel
fi

if type "pacman" > /dev/null; then
    sudo pacman -S --noconfirm base-devel
    sudo pacman -S --noconfirm libpcap libdnet ruby libffi python2 python2-pip python2-virtualenv openssl geoip
fi

# Workaround for arch linux
command -v pip >/dev/null 2>&1 || {
    sudo ln -s /usr/bin/pip2 /usr/bin/pip
    sudo ln -s /usr/bin/python2 /usr/bin/python
    sudo ln -s /usr/bin/virtualenv2 /usr/bin/virtualenv
}

sudo pip install virtualenv-tools
# Note: on arch linux you need to then repeat this step as a user
gem install fpm --no-rdoc --no-ri
echo "PATH=$HOME/.gem/ruby/2.4.0/bin/$$PATH" >> $HOME/.bashrc
