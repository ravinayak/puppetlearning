package { 'mysql':
	ensure => present,
	provider => gem,
	name => 'mysql',
}

package { 'rpm mysql':
	ensure => present,
	name => 'mysql',
}