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

}
