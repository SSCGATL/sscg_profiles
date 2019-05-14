# Load and install PHP
class sscg_profiles::php {

  class { 'php':
    ensure => 'latest',
  }

}
