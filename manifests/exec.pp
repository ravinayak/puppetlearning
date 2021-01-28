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
	onlyif => '/tmp/file_creation/abc.txt',
}
