include stdlib
include accounts
include includecheck
include basicresourcetypes
# $ensure_value = 'absent'
# Class { 'basicresourcetypes::groupresourcetype':
#   ensure_val => 'present',
#   users      => [
#     {
#       name   => 'test-user-1',
#       uid    => 3001,
#       groups => 'group3',
#       gid    => 1015,
#     },
#     {
#       name   => 'test-user-2',
#       uid    => 3002,
#       groups => 'group1',
#       gid    => 1016
#     },
#     {
#       name   => 'test-user-3',
#       uid    => 3003,
#       groups => 'group2',
#       gid    => 1017
#     }
#   ]
# }
include gppuppet
$greeting = gppuppet::saymyname('Mr Anderson')
$puppet_greeting = gppuppet::sayname('Mr Neo')
notice($greeting)
notice($puppet_greeting)
$env = gppuppet::parseenv('oradb-p-001234')
$puppet_env = gppuppet::parsepuppetenv('oradb-t-001222')
notice($env)
notice($puppet_env)

$params = {
  'node_name'             => $trusted['certname'],
  'os_name'               => $facts['os']['distro']['id'],
  'os_distro_description' => $facts['os']['distro']['description'],
  'os_distro_codename'    => $facts['os']['distro']['codename'],
  'elements_arr'          => [1,2,3,4,5]
}

file { '/etc/templated_file.txt':
  ensure  => 'file',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => epp('gppuppet/templating_file.epp', $params),
}

$params2 = {
  'name_value_pair_hash' => {
    '1st_entry' => {
      'name' => 'Tom',
      'age'  => 25,
      },
    '2nd_entry' => {
      'name' => 'Harry',
      'age'  => 55,
    },
    '3rd_entry' => {
      'name' => 'Dick',
      'age'  => 75,
    }
  }
}

  file { '/etc/templated_file_2.epp':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('gppuppet/templating_file_2.epp', $params2),
  }

  # Class {'gppuppet::conditionals':
  # }
  Class {'gppuppet::conditionals':
    host     => 'oadb-q-000123',
    bool_str => undef,
    case_var => 'prod',
  }
  # notice('Below is a function scoped to production environment')
  # $environ = environment::parsepuppetenv('oadb-q-00002')
  gppuppet::definedtypesuserwithhomeandsshauthorizedkey { 'neo1-defined-type':
    username             => 'neo1',
    uid                  => 1090,
    gid                  => 5090,
    group_gids           => [5091, 5092],
    fileforuserinhomedir => 'welcome-neo1.txt',
    key_type             => 'ssh-rsa',
    key                  => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQCdCqo/WINChXYwxFbXRCxtZY9NJrd0kLpHU+u1f78EVDe7XG50Jtoqix8c976Zc+DXrsm/jQtRS6jK8bH+SV13CuMHIov4z4Msqvoc1MfD5i8qRCr7+0310I/Tckxv3/JSUnu6mVj6q47jqg4wU3OHuec+3VLWrNM03Ri1JS2jzLysUyxYwO7Vi99EMofDKLnjGwiNrkiUauwxafISeNz+AEsdiqzNoasvBj20Fs75P5BK67te2D8P3XoCLUwkypSAqeZnurnFDO+nJDj4rnAYFBhMFIbh8U58JQQhJ5j2rDkcR1rJQkevWcZcplSWtXnPgGJkddGZqSh0RFyxlGXTN2TvjNzE2aZ2T6qR2BXVGDdLRM5MUILaHrCYqSCtSjL9/zu+dVrOZt+vE/MDtfRy5uJ4Ew5rvdE1FIOLfqBZJqyv0KyWsmaTNLRxdDaAT1IlOPxbQMq5FWiEJz1KWE6jiyOiAeX7+4/Wnq9rGgtqqyvaC76MumE4//clxzVaVEM='
  }
