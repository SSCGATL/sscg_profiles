# Profile to manage the base hardening of the server
class sscg_profiles::hardening {

  # Filesystem Modules to remove
  $fs_modules = [ 'cramfs','freevxfs','jffs2','hfs','hfsplus','squashfs','udf','vfat' ]

  # Turn off unneeded Filesystem Support
  file { '/etc/modprobe.d/CIS.conf':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/sscg_profiles/CIS.conf',
  }

  # Remove the filesystem kernel modules from the server
  $fs_modules.each | String $module | {
    exec { 'remove_fs_modules':
      path    => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
      command => "/usr/sbin/rmmod ${module}",
      require => File['/etc/modprobe.d/CIS.conf'],
    }
  }

}
