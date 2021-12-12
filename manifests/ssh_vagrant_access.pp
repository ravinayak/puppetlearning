ssh_authorized_key { 'vagrant@maverick':
  ensure => present,
  user   => 'vagrant',
  type   => 'ecdsa-sha2-nistp256',
  key    => 'AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBJ0QjPCuJhYwXXyktZfArFsN3LxZKrayzahEe+nbhGG9JdMNbK4zAppOj/IQaG4SLIQjZIehIyu4bkVFQiPxTVE=',
}
