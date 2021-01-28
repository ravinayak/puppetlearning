package { 'ntp':
	ensure => installed,
}
package { 'openssl':
	ensure => '1.0.2g-1ubuntu4.8',
}
package { 'ruby':
	ensure => installed,
}

package { 'puppet-lint':
	provider => gem,
}

package { 'r10k':
	ensure => installed,
	provider => puppet_gem,
}

service { 'ntp':
	enable      => true,
	ensure      => running,
}