# Main Website Vhost
class sscg_profiles::mvcf {

  apache::vhost { 'midtownvcf.org':
    port          => '80',
    docroot       => '/var/www/html/midtownvcf.org',
    servername    => 'midtownvcf.org',
    serveraliases => [
      'www.midtownvcf.org',
    ],
  }
}
