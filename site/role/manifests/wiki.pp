class role::wiki {
  contain profile::default
  contain profile::firewall
  contain profile::postfix
  contain profile::php
  contain profile::nginx
}
