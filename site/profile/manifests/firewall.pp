class profile::firewall {
  contain ::firewall

  Firewall {
    require => Package['iptables']
  }

  firewall { '000 accept icmp':
    proto  => 'icmp',
    action => 'accept'
  }

  firewall { '001 accept loopback':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept'
  }

  firewall { '002 accept related/established':
    proto  => 'all',
    state  => [ 'RELATED', 'ESTABLISHED' ],
    action => 'accept',
  }

  firewall { '100 accept ssh':
    action => 'accept',
    proto  => 'tcp',
    dport  => '22'
  }

  firewall { '200 accept http':
    action => 'accept',
    proto  => 'tcp',
    dport  => '80'
  }

  firewall { '200 accept https':
    action => 'accept',
    proto  => 'tcp',
    dport  => '443'
  }

  firewall { '999 drop-all':
    action => 'drop'
  }
}
