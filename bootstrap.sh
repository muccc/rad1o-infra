#!/bin/bash

set -e
test -z "${SUDO_USER}" && (echo "Sorry, can't let you do that. Try sudo."; exit 1)

if [ ! -e /usr/bin/puppet ]; then
  wget http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
  dpkg -i puppetlabs-release-trusty.deb
  apt-get -y install puppet
fi

apt-get update

test -e /usr/bin/ruby || apt-get install ruby
test -e /usr/bin/apt-add-repository ||  apt-get -y install software-properties-common
test -e /usr/local/bin/r10k || gem install r10k

r10k puppetfile install -v 0 || exit 1

test -L /etc/puppet/modules || rm -rf /etc/puppet/modules
test -L /etc/puppet/data || ln -s /home/${SUDO_USER}/puppet/data/ /etc/puppet/data

/home/${SUDO_USER}/puppet/run_puppet.sh
