# Install Java as a test
class sscg_profiles::java {

  java::oracle { 'jdk8' :
    ensure  => 'present',
    version => '8',
    java_se => 'jdk',
  }

}
