file { '/tmp/file_creation':
	ensure => directory,	
}
file { '/tmp/file_creation/file_creation.sh':
	ensure => present,
	content => 'touch abc.txt',
	mode => '0755'
}
exec {'random-command':
	cwd => '/tmp/file_creation',
	path => '/tmp/file_creation'
	command => './file_creation.sh',
	creates => '/tmp/file_creation/abc.txt',
}
