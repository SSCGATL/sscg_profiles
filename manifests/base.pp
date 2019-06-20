# Base profile for all nodes
class sscg_profiles::base {

  include sscg_profiles::hardening
  include sscg_profiles::ntp

}
