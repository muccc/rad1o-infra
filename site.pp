node 'rad1o' {
  contain profile::firewall
  contain profile::postfix
  contain profile::php
  contain profile::nginx

  package { ['htop', 'imagemagick']: ensure => present }
}
