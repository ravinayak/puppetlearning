# include stdlib
# include accounts
# include includecheck
# include basicresourcetypes
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
# include gppuppet
# $greeting = gppuppet::saymyname('Mr Anderson')
# $puppet_greeting = gppuppet::sayname('Mr Neo')
# notice($greeting)
# notice($puppet_greeting)
# $env = gppuppet::parseenv('oradb-p-001234')
# $puppet_env = gppuppet::parsepuppetenv('oradb-t-001222')
# notice($env)
# notice($puppet_env)

# $params = {
#   'node_name'             => $trusted['certname'],
#   'os_name'               => $facts['os']['distro']['id'],
#   'os_distro_description' => $facts['os']['distro']['description'],
#   'os_distro_codename'    => $facts['os']['distro']['codename'],
#   'elements_arr'          => [1,2,3,4,5]
# }

# file { '/etc/templated_file.txt':
#   ensure  => 'file',
#   owner   => 'root',
#   group   => 'root',
#   mode    => '0644',
#   content => epp('gppuppet/templating_file.epp', $params),
# }

# $params2 = {
#   'name_value_pair_hash' => {
#     '1st_entry' => {
#       'name' => 'Tom',
#       'age'  => 25,
#       },
#     '2nd_entry' => {
#       'name' => 'Harry',
#       'age'  => 55,
#     },
#     '3rd_entry' => {
#       'name' => 'Dick',
#       'age'  => 75,
#     }
#   }
# }

#   file { '/etc/templated_file_2.epp':
#     ensure  => file,
#     owner   => 'root',
#     group   => 'root',
#     mode    => '0644',
#     content => epp('gppuppet/templating_file_2.epp', $params2),
#   }

#   # Class {'gppuppet::conditionals':
#   # }
#   Class {'gppuppet::conditionals':
#     host     => 'oadb-q-000123',
#     bool_str => undef,
#     case_var => 'prod',
#   }
#   # notice('Below is a function scoped to production environment')
#   # $environ = environment::parsepuppetenv('oadb-q-00002')
#   gppuppet::definedtypesuserwithhomeandsshauthorizedkey { 'neo1-defined-type':
#     username             => 'neo1',
#     uid                  => 1090,
#     gid                  => 5090,
#     group_gids           => [5091, 5092],
#     fileforuserinhomedir => 'welcome-neo1.txt',
#     key_type             => 'ecdsa-sha2-nistp256',
#     key                  => 'AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBH5PFa4/QIJuMF1dtlC5hj+Lvq7/Va+UXXSNWgmvYpeMgKORHYglch0CmK+vz0QRFvPBEGV78bQ95VBcHQyeMxI='
#   }
#   Class {'gppuppet::advancedusageresources': }
#   $users_hash=lookup('accounts::users')
#   $groups=lookup('groups')
#   $groups.each |$group| {
#     group { $group[0]:
#       * => $group[1]
#     }
#   }
#   $users_hash.each |$user| {
#     accounts::user { $user[0]: 
#       * => $user[1],
#     }
#   }

#   exec { 'apt-get install command':
#     command   => 'sudo apt-get install gnupg rng-tools -y',
#     path      => ['/usr/bin', '/usr/local/bin'],
#     creates   => '/etc/systemd/system/dev-hwrng.device.wants/rng-tools.service',
#     logoutput => true,
#   }
#   accounts::user { 'neo2':
#     uid         => 10080,
#     gid         => 50045,
#     shell       => '/usr/bin/bash',
#     system      => false,
#     groups      => [
#       'engineering',
#       'automation'
#     ],
#     comment     => "Neo-2 Nayak",
#   }
# class gppuppet::manualpuppetpractice{
#   define defaultresources{
#     file {'/etc/defaultdefinedtype.txt':
#       ensure => file,
#     }
#   }
# }
# gppuppet::manualpuppetpractice::defaultresources{'newdeaults':}
