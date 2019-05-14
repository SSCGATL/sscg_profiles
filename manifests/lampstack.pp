# Full Lamp Stack Profile
class sscg_profiles::lampstack {

  include sscg_profiles::apache
  include sscg_profiles::mysql
  include sscg_profiles::php

}
