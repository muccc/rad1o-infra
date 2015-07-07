define profile::ssl::dhparam (
  $file,
  $strength=2048,
) {
  exec { "${name}-generate-dhparams":
    command => "openssl dhparam -rand - -out ${file} ${strength}",
    creates => $file,
    path => join(['/usr/bin', '/usr/sbin', '/bin', '/sbin'], ':')
  }
}
