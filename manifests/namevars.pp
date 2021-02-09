package { 'mysql':
	ensure => installed,
	provider => gem,
}

package { 'mysql':
	ensure => installed,
	name => 'mysql-one',
}