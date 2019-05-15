# Profile to manage the base hardening of the server
class sscg_profiles::hardening {

  # Turn off unneeded Filesystem Support
  file { '/etc/modprobe.d/CIS.conf':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/sscg_profiles/CIS.conf',
  }

  # Ensure the aide package is installed and configured
  package { 'aide':
    ensure => 'installed',
  }

  -> exec { 'init_aide':
    path    => '/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin',
    command => 'aide --init',
    creates => '/var/lib/aide/aide.db.new.gz',
    onlyif  => 'test ! -f /var/lib/aide/aide.db.gz',
  }

  -> exec { 'setup_aide_db':
    path    => '/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin',
    command => 'mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz',
    onlyif  => 'test -f /var/lib/aide/aide.db.new.gz',
  }

  # Set crontab to run aide periodically
  cron { 'aide':
    command => '/usr/sbin/aide --check',
    user    => 'root',
    hour    => '2',
    minute  => '01',
  }

}
