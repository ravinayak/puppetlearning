group { 'dave':
 	gid => '20',
 	ensure => absent,
 } 

user { 'new-user':
	ensure => absent,
}
