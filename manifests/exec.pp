file { '/tmp/file_creation':
	ensure => directory,	
}
file { '/tmp/file_creation/file_creation.sh':
	ensure => present,
	content => '/usr/bin/touch abc.txt',
	mode => '0755',
}
exec {'random-command':
	cwd => '/tmp/file_creation',
	path => '/tmp/file_creation',
	command => '/usr/bin/bash file_creation.sh',
	onlyif => '/bin/ls -l /tmp/file_creation/abc.txt',
}

file {'/tmp/notify-file.txt': 
	content => 'Hi there',
	notify => Exec['next-command'],
}
exec {'next-command': 
	cwd => '/tmp',
	command => '/bin/date +%F > /tmp/new-date.txt',
}