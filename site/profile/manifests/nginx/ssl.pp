class profile::nginx::ssl (
  $path = '/etc/nginx/ssl',
  $protocols = 'TLSv1 TLSv1.1 TLSv1.2',
  $ciphers   = 'DH+AESGCM:DH+SHA384:DH+SHA256:DH+AES+SHA:DH+CAMELLIA:DH+SEED:ECDH+aRSA+AES:!aNULL:!eNULL:!DSS',
  $ssl_cache = 'shared:SSL:10m',
  $dh_strength = 2048,
  $dh_file = '/etc/nginx/ssl/dhparams.pem',
) {
  file { $path:
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0744'
  } ->

  profile::ssl::dhparam { 'nginx':
    file     => $dh_file,
    strength => $dh_strength,
  }
}
