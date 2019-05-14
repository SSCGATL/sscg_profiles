# Main Website Vhost
class sscg_profiles::sscgatl {

  apache::vhost {
    docroot     => '/var/www/html/ssconsultinggroup.net',
    servername  => 'ssconsultinggroup.net',
    serveralias => 'www.ssconsultinggroup.net',
  }

  apache::mod { 'mod_php': }

}
