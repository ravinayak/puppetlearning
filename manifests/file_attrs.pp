use {'ninja':
	ensure => present,
}
file { "/etc/ninja":
	owner => 'ninja',
	ensure => true,
	group => 'ninja',
	mode => '0644',
}

file { '/etc/sample_dir':
	ensure => directory,
	owner => 'vagrant',
	group => 'vagrant',
	mode => '0755',
}

file { '/etc/symbolic_link': 
	ensure => link,
	target => '/etc/motd',
}

file {'/etc/tree_sample_dir':
	source => '/examples/sample_dir',
	recurse => true,
}