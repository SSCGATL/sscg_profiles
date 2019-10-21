# Main Website Vhost
class sscg_profiles::sscgatl {

  apache::vhost { 'ssconsultinggroup.net':
    port          => '80',
    docroot       => '/var/www/html/ssconsultinggroup.net',
    servername    => 'ssconsultinggroup.net',
    serveraliases => [
      'www.ssconsultinggroup.net',
      'www.sscgatl.com',
      'sscgatl.com',
    ],
  }
}
