file {'/usr/local/bin/run-puppet':
	source => '/codetestfiles/puppetlabs/code/environments/production/puppetlearning/files/puppet-run.sh',
	mode => '0755',
}

cron {'run-puppet':
	command => '/usr/local/bin/run-puppet',
	hour => '*',
	minute => '*/15',
}
