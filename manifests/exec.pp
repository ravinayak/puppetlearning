file { '/tmp/file_creation':
	ensure => directory,	
}
file { '/tmp/file_creation/file_creation.sh:'
	ensure => file,
	content => 'touch abc.txt'
}
exec {'/tmp/file_creation.sh':
	cwd => '/tmp/file_creation',
	command => 'source file_creation.sh',
	creates => '/tmp/file_creation/abc.txt',
}
