# Profile to configure NTP
class sscg_profiles::ntp {

  $ntpservers = lookup('sscg_profiles::ntpservers')

  class { 'ntp':
    servers => $ntpservers,
  }

}
