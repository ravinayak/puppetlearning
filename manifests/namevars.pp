package { 'mysql':
	ensure => absent,
	name => 'mysql',
}

package { 'rpm mysql':
	ensure => absent,
	name => 'mysql',
}