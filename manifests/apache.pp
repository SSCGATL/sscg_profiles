class sscg_profiles::apache {

  class { 'apache':
    default_vhost => false,
    mpm_module    => 'prefork',
  }

  class { '::apache::mod::php': }

  # Ensure subdirectories always get owned by Apache
  file { '/var/www/html':
    ensure  => 'directory',
    owner   => 'apache',
    group   => 'apache',
    recurse => true,
  }

}
