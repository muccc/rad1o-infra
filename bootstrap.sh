#!/bin/bash

if [ ! -e /usr/bin/puppet ]; then
  wget http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
  dpkg -i puppetlabs-release-trusty.deb
  apt-get update
fi

if [ ! -e /usr/bin/ruby ]; then
  apt-get install ruby
fi

apt-get -y install puppet
apt-get -y install software-properties-common

r10k version >/dev/null 2>&1 || gem install r10k

r10k puppetfile install -v 0 || exit 1

rm -rf /etc/puppet/modules

ln -s /home/codec/puppet/modules/ /etc/puppet/modules
ln -s /home/codec/puppet/data/ /etc/puppet/data

./run_puppet.sh
