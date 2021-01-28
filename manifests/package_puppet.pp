package { 'ntp':
	ensure => installed,
}

package { 'r10k':
	ensure => installed,
	provider => puppet_gem,
}

file {'/etc/motd.txt':
	ensure => present,
	content => 'Hi there',
	notify => Service['ntp'],
}
service { 'ntp':
	enable      => true,
	ensure      => running,
	hasstatus => false,
	pattern => 'ntpd',
	hasrestart => true,
	restart => '/bin echo Restarting >> /tmp/debug.log && systemctl restart ntp',
}