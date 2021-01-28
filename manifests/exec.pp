file { '/tmp/file_creation':
	ensure => directory,	
}
file { '/tmp/file_creation/file_creation.sh':
	ensure => present,
	content => 'touch abc.txt'
}
exec {'random-command':
	cwd => '/tmp/file_creation',
	command => 'source file_creation.sh',
	creates => '/tmp/file_creation/abc.txt',
}
