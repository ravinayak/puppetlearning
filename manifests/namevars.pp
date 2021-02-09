package { 'mysql':
	ensure => absent,
	provider => gem,
}

package { 'rpm mysql':
	ensure => absent,
	provider => gem,
}