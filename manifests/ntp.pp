# Profile to configure NTP
class sscg_profiles::ntp {

  $ntpservers = lookup('sscg_profiles::ntp::ntpservers')

  class { 'ntp':
    servers       => $ntpservers,
    iburst_enable => true,
  }

}
