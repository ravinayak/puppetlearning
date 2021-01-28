
file {'/etc/motd1.txt':
	ensure => present,
	content => 'Hi there',
	notify => Service['ntp'],
}
service { 'ntp':
	user => root,
	enable      => true,
	ensure      => running,
	hasstatus => false,
	pattern => 'ntpd',
	hasrestart => true,
	restart => '/bin echo Restarting >> /tmp/debug.log && systemctl restart ntp',
}