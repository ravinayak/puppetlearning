group { 'dave':
 	gid => '20',
 	ensure => present,
 } 

user { 'new-user':
	ensure => present,
	uid => 1001,
	home => '/home/new-user',
	shell => '/bin/bash',
	groups => ['dave'],
}
