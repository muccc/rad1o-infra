class profile::default {
  package { ['htop', 'imagemagick']: ensure => present }
}
