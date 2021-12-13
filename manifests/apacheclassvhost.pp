class apacheclassvhost(
  String $docroot,
  Array[String] $vhost,
  Variant[Integer,String] $port=8080,
){
  Class{ 'apache': }
  apache::vhost { $vhosts[0]:
    port          =>  $port,
    docroot       => '/var/www/user',
    docroot_owner => 'www-data',
    docroot_group => 'www-data',
  }
  apache::vhost { $vhosts[1]:
    port          => $port,
    docroot       => '/var/www/usr',
    docroot_owner => 'www-data',
    docroot_group => 'www-data',
  }
}
