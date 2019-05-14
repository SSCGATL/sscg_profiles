# MySQL profile
class sscg_profiles::mysql {

  class { 'mysql::server':
    root_password           => 'B@sslin3',
    remove_default_accounts => true,
  }
}
