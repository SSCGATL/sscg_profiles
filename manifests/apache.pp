class sscg_profiles::apache {

  class { 'apache':
    mpm_module    => 'prefork',
  }

  # Ensure subdirectories always get owned by Apache
  file { '/var/www/html':
    ensure  => 'directory',
    owner   => 'apache',
    group   => 'apache',
    recurse => true,
  }

}
