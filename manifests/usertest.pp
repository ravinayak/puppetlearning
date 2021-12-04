include stdlib
class usertest(
    String $ensure_val,
  Array[Hash[String, Variant[String, Integer]]] $users,
){
  $users.each |$user| {
    user { $user['name']:
      ensure     => $ensure_val,
      uid        => $user['uid'],
      membership => inclusive,
      groups     => $user['groups'],
      gid        => $user['gid'],
    }
  }
  group { 'primary_group_tommyy':
    ensure => $ensure_val,
    gid    => 3043,
    system => false,
  }
  group { 'primary_group_dickkyy' :
    ensure => $ensure_val,
    gid    => 3044,
    system => false,
  }
  group { 'primary_group_harryy':
    ensure => $ensure_val,
    gid    => 3045,
    system => false,
  }
  group{ 'group_1':
    ensure => $ensure_val,
    name   => 'test-group-1',
    #auth_membership => false,
    #members         => ['Tommyy', 'Dickky'],
    gid    => 3051,
  }
  group { 'group_2':
    ensure => $ensure_val,
    name   => 'test-group-2',
    #auth_membership => false,
    #members         => ['Dickky', 'Harryy'],
    gid    => 3055,
  }
  $names_arr = $users.reduce([]) |$result, $user| { $result << $user['name'] }
  Group['test-group-1', 'test-group-2'] ~> User[$names_arr]
  # User[$names_arr] ~> Group['test-group-1', 'test-group-2', 'primary_group_tommyy', 'primary_group_dickkyy', 'primary_group_harryy']

  # User[$users] ~> Group['group_1', 'group_2']
}
Class{ 'usertest':
  ensure_val => 'present',
  users      => [
    {
      name   => 'Tommyy',
      uid    => 10060,
      groups => 'test-group-1',
      gid    => 3043,
    },
    {
      name   => 'Dickky',
      uid    => 10061,
      groups => 'test-group-1',
      gid    => 3044,
    },
    {
      name   => 'Harryy',
      uid    => 10062,
      groups => 'test-group-2',
      #groups => ['test-group-2'],
      gid    => 3045,
    }
  ]
}

# class usertest(
#   $users,
# ){
#   create_resources(user,$users)
#   group{'group_1':
#     ensure          => present,
#     name            => 'test-group-1',
#     auth_membership => false,
#     members         => ['tommy', 'dicky'],
#     gid             => 3051,
#   }
#   group { 'group_2':
#     ensure          => present,
#     name            => 'test-group-2',
#     auth_membership => false,
#     members         => ['dicky', 'harryy'],
#     gid             => 3055,
#   }
#   #User[$users] ~> Group['group_1', 'group_2']
# }
# Class{ 'usertest':
#   users => {
#     'tommy'  => {
#       ensure => present,
#       uid    => 10051,
#     },
#     'dickky' => {
#       ensure => present,
#       uid    => 10052,
#     },
#     'harryy' => {
#       ensure => present,
#       uid    => 10053
#     }
#   }
# }
