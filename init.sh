#!/usr/bin/env bash

set -e
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y upgrade
apt-get -y install git ruby ruby-dev build-essential \
    libdumbnet-dev libpcap-dev libgeoip-dev libffi-dev python-dev python-pip python-virtualenv libssl-dev
pip install virtualenv-tools
gem install fpm --no-rdoc --no-ri
