package { 'mysql':
	ensure => absent,
	provider => gem,
	name => 'mysql',
}

package { 'rpm mysql':
	ensure => absent,
	name => 'mysql',
}