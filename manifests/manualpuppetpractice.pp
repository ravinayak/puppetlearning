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
# Class { 'gppuppet::advancedresourcetypes::advancedresourcetypesdefaults': }

# In this example to demonstrate how virtual resources can solve the commonly seen problem of different modules requiring same packages
# 2 solutions are possible in this case, one is to move all virtual resources into the top module, and include this module wherever the
# virtual resources are needed. This works because (just like classes - where same class can be included multiple times - multiple 
# declarations of same class using inlcude does not result in multiple instances being created - only 1 instance is created -and only 1nce
# it is included in the catalog) only 1 instance of virtual resource is ever created no matter how many classes include the same virtual
# resource
# Details of the following example:
#   1. virtualres: 
#       a. virtualuser: neo5  : This user is needed to be the owner of files created in different modules
#       b. virtualfile: /etc/filexec...: This file is used as the source for files in different modules
#       Summary: We declare 'neo5' and 'fileexec' to be virtual resources so that dependent modules can inlcude them without any issue
#   2. realizeres1:
#       a. /etc/filerealizeres1: This file is owned by neo5 and has contents same as file declared as virtual file - fileexec
#   3. realizeres2:
#       Same as avove
# 
# realizeres1 and realizeres2 both depend on user neo5 and fileexec to work. If they both include those resources, there could be a conflict
# that same resources are being created (or attempt to create) in different modules. To solve this problem we declare them in a virtual 
# module and include the module in both realizeres1 and realizeres2

# NOTE: For large software components which are reusable and needed by many other (large #) of other components, it is justified to create 
#       a module and use it in those modules/classes which are dependent upon it. However for smaller pieces of components/software, it is 
#       not justified to create modules. The piece of functinoality which is needed by more than 1 module can be written inside a class and 
#       included in the module itself. This allows software components which depend critically on certain resources to wrap them in the 
#       same module

# include realizeres1
# include realizeres2

# We write two other modules realizewithclassres1 and realizewithclassres2 which include the dependency inside them inside a class and 
# include both of them here for demonstrating that including modules which include the same class at 2 different places does not cause 
# any conflict
# include realizewithclassres1
# include realizewithclassres2

# Including virtualresource module so we can see different search scenarios of resource collectors. If we realize a virtual file resource 
# before it is defined in the same file, then it actually creates that resource. There is no compilation error. One possible explanation 
# could be that evluation order of virtual resources does not impact its realizability in the same file, but if you declare virtual 
# resource in another file, and include it, then the order of realizing the resource and definition does matter
# realize File['/etc/realizethisfilebeforedefine.txt']

# If we try to realize a virtual resource before it is defined using resource collector, nothing is realized, nor any error is thrown. This
# is consistent with what is written in the text

File <| tag == realizebeforedefine |>

@file{ '/etc/realizethisfilebeforedefine.txt':
  ensure => present,
  tag    => 'realizebeforedefine',
}

# Here we try to realize the virtual resources 1st and then include it - 2nd

  # realize before virtual resource is defined: th is leads to a compilation error and halts the processing of manifest

  # realize File['/etc/defineprerealize.txt']

  # Resource Collector collecting before definition of file. This works and returns without any output because no matching virtual resource
  # is found

  File <| tag == searchablefiles |>

  # Include the module which contains virtual resource on which resource collector and realize are called post those commands. Realize 
  # before define
  include virtualres

  # Using exported resources requires puppetdb configuration on agent node. Installing is not difficult, considering it can be easily
  # installed as an agent. However, Setting up SSL certificates can be tricky. Official recommendation is to setup a puppet server and use 
  # it. Since we are running single nodes, it would make sense to configure SSL with Apache (if installed) or Nginx to use the SSL feature
  # More configurations are rquired for testing export of resources
  # It is important to go through this step and finalize an approach and to get it to work. Services like Nagios will require this setup
  # of exported resources to work to be able to monitor nodes for all kinds of services etc
  # Commenting out following because puppetdb configuration for node is not implemented
  # storeconfigs and other settings needs to be done in puppet.conf file for exporting to work
  # See this page: https://puppet.com/docs/puppetdb/7/install_via_module.html
  # include exportedresourcessh
