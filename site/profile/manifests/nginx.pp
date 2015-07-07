class profile::nginx (
  $vhosts,
  $locations
) {
  validate_hash($vhosts)
  validate_hash($locations)

  contain ::nginx
  contain ::profile::nginx::ssl

  Nginx::Resource::Vhost {
    ssl_protocols => $profile::nginx::ssl::protocols,
    ssl_ciphers   => $profile::nginx::ssl::ciphers,
    ssl_cache     => $profile::nginx::ssl::ssl_cache,
  }

  create_resources('nginx::resource::vhost', $vhosts)
  create_resources('nginx::resource::location', $locations)
}
